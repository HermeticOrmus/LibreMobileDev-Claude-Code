#!/usr/bin/env bash
# Session Start Hook - Mobile Development (libre-mobiledev-hooks)
# Detects mobile project context and tells Claude which platforms are present.
#
# Claude Code sends the hook input as JSON on stdin; this reads "cwd".
# Prints one short line on stdout (added to the session context) only when
# the project looks like a mobile app. Prints nothing otherwise.

# No set -e on purpose: a hook that exits 2 blocks the tool call, so every
# path here ends in exit 0. Written for bash 3.2 (macOS) and later.

input="$(cat)"
command -v jq >/dev/null 2>&1 || exit 0

dir="$(jq -r '.cwd // empty' <<<"$input" 2>/dev/null)"
[ -n "$dir" ] && [ -d "$dir" ] || dir="$PWD"

platforms=()

# Flutter
[ -f "$dir/pubspec.yaml" ] && platforms+=("Flutter")

# React Native / Expo: app.json or package.json that depends on react-native or expo
if [ -f "$dir/package.json" ] && grep -qE '"(react-native|expo)"[[:space:]]*:' "$dir/package.json" 2>/dev/null; then
  platforms+=("React Native")
elif [ -f "$dir/app.json" ] && [ -f "$dir/package.json" ]; then
  platforms+=("React Native")
fi

# iOS: ios/ folder, Podfile, or an Xcode project at the root
if [ -d "$dir/ios" ] || [ -f "$dir/Podfile" ] || compgen -G "$dir/*.xcodeproj" >/dev/null; then
  platforms+=("iOS")
fi

# Android: android/ folder, or a Gradle build that applies the Android plugin
if [ -d "$dir/android" ] || grep -qs 'com.android' "$dir/build.gradle" "$dir/build.gradle.kts" "$dir/app/build.gradle" "$dir/app/build.gradle.kts" 2>/dev/null; then
  platforms+=("Android")
fi

[ "${#platforms[@]}" -eq 0 ] && exit 0

list="$(printf '%s, ' "${platforms[@]}")"
echo "[libre-mobiledev] Mobile project detected (${list%, }). The libre-mobiledev agents, commands, and skills apply here."
exit 0
