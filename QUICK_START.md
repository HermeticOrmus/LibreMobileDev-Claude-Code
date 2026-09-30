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

### Install in Grok Build

```bash
grok plugin marketplace add HermeticOrmus/LibreMobileDev-Claude-Code
grok plugin install flutter-development@LibreMobileDev-Claude-Code --trust
```

Or one plugin straight from its folder: `grok plugin install HermeticOrmus/LibreMobileDev-Claude-Code#plugins/flutter-development --trust`. From a clone, `./setup.sh --grok` installs every plugin into Grok Build. `libre-mobiledev-hooks` uses a hook format Grok Build supports, but it has not been verified in a live Grok session yet.

Then ask:

```
/flutter design a state management strategy for an app with offline-first reads, conflict resolution on sync, deep links from push notifications. Riverpod or BLoC?
```

Expected: Riverpod recommendation with reasoning, widget tree sketch, offline-first via drift, sync conflict resolution patterns, deep link routing via go_router with state restoration.

See learning paths for deeper progressions.
