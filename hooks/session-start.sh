#!/bin/bash
# Session Start Hook - Mobile Development
# Detects project context and configures the session

LOG_DIR="$(dirname "$0")/logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/session-$(date +%Y%m%d-%H%M%S).log"

log() {
  echo "[$(date +%H:%M:%S)] $1" >> "$LOG_FILE"
}

log "Session started"
log "Working directory: $(pwd)"

# Detect Mobile Development context
detect_context() {
  local indicators=0
  
  
  [ -f "pubspec.yaml" ] && indicators=$((indicators + 1))
  [ -f "app.json" ] && indicators=$((indicators + 1))
  [ -f "build.gradle" ] && indicators=$((indicators + 1))
  [ -d "ios/" ] && indicators=$((indicators + 1))
  [ -d "android/" ] && indicators=$((indicators + 1))
  [ -f "Podfile" ] && indicators=$((indicators + 1))

  
  echo "$indicators"
}

CONTEXT_SCORE=$(detect_context)
log "Context score: $CONTEXT_SCORE"

if [ "$CONTEXT_SCORE" -gt 0 ]; then
  log "Mobile Development project detected"
  echo "[Mobile Development] Project context detected. Relevant plugins activated."
else
  log "No Mobile Development context found"
fi

# Check for project-specific configuration
if [ -f "CLAUDE.md" ]; then
  log "Found project CLAUDE.md"
fi

if [ -f ".claude/settings.json" ]; then
  log "Found Claude settings"
fi

log "Session start hook complete"
