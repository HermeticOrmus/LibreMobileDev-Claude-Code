# Quick start

Inside Claude Code:

```
/plugin marketplace add HermeticOrmus/LibreMobileDev-Claude-Code
/plugin install flutter-development@libre-mobiledev
```

Or clone and install every plugin through the Claude Code CLI:

```bash
git clone https://github.com/HermeticOrmus/LibreMobileDev-Claude-Code.git ~/projects/LibreMobileDev-Claude-Code
cd ~/projects/LibreMobileDev-Claude-Code
./setup.sh
```

```
/flutter design a state management strategy for an app with offline-first reads, conflict resolution on sync, deep links from push notifications. Riverpod or BLoC?
```

Expected: Riverpod recommendation with reasoning, widget tree sketch, offline-first via drift, sync conflict resolution patterns, deep link routing via go_router with state restoration.

See learning paths for deeper progressions.
