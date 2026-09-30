#!/usr/bin/env bash
# Pre-Tool-Use Hook - Mobile Development (libre-mobiledev-hooks)
# Validates actions before execution.
#
# Claude Code sends the hook input as JSON on stdin; this reads "tool_name",
# "tool_input.file_path", and "tool_input.command".
#
# - A file tool that targets a sensitive file (.env, .pem, .key, credentials,
#   secrets, signing keys, provisioning profiles, Firebase config) asks you
#   to confirm first.
# - A shell command that reads one of those files, or that is destructive
#   (rm -rf, force push, hard reset, fastlane match nuke), asks you to
#   confirm first.
# Everything else passes silently.

# No set -e on purpose: a hook that exits 2 blocks the tool call, so every
# path here ends in exit 0. Written for bash 3.2 (macOS) and later.

input="$(cat)"
command -v jq >/dev/null 2>&1 || exit 0

tool="$(jq -r '.tool_name // empty' <<<"$input" 2>/dev/null)"
path="$(jq -r '.tool_input.file_path // .tool_input.notebook_path // .tool_input.path // empty' <<<"$input" 2>/dev/null)"
cmd="$(jq -r '.tool_input.command // empty' <<<"$input" 2>/dev/null)"

ask() {
  jq -cn --arg reason "$1" '{hookSpecificOutput: {hookEventName: "PreToolUse", permissionDecision: "ask", permissionDecisionReason: $reason}}'
  exit 0
}

# Sensitive files: env files (not .example/.sample/.template), private keys
# and certificates, credentials and secrets files, Android and iOS signing
# material (keystores, key.properties, .p8 API keys, provisioning profiles),
# and Firebase config files.
is_sensitive() {
  local p
  p="$(basename -- "$1")"
  case "$p" in
    *.example|*.sample|*.template|*.dist) return 1 ;;
  esac
  grep -qiE '^\.env($|\.)|\.(env|pem|key|p8|p12|pfx|jks|keystore|mobileprovision|provisionprofile)$|(^|[._-])(credentials?|secrets?)([._-]|$)|^(key|keystore)\.properties$|^google-services\.json$|^GoogleService-Info\.plist$' <<<"$p"
}

check_sensitive_files() {
  if [ -n "$path" ] && is_sensitive "$path"; then
    ask "libre-mobiledev: $tool targets a potentially sensitive file ($path). Confirm before continuing."
  fi
  if [ -n "$cmd" ]; then
    local tok
    set -f
    for tok in $cmd; do
      tok="${tok//\"/}"; tok="${tok//\'/}"
      case "$tok" in
        */*|*.*) is_sensitive "$tok" && ask "libre-mobiledev: this command touches a potentially sensitive file ($tok). Confirm before continuing." ;;
      esac
    done
    set +f
  fi
}

check_destructive_ops() {
  [ -n "$cmd" ] || return 0
  if grep -qE '(^|[;&|[:space:]])rm[[:space:]]+-[a-zA-Z]*[rR][a-zA-Z]*f|(^|[;&|[:space:]])rm[[:space:]]+-[a-zA-Z]*f[a-zA-Z]*[rR]|git[[:space:]]+push[^;&|]*(--force|[[:space:]]-f([[:space:]]|$))|git[[:space:]]+reset[[:space:]]+--hard|fastlane[[:space:]]+match[[:space:]]+nuke' <<<"$cmd"; then
    ask "libre-mobiledev: destructive command detected ($cmd). Confirm before continuing."
  fi
}

check_sensitive_files
check_destructive_ops
exit 0
