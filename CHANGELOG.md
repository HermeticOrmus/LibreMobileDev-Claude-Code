# Changelog

## [Unreleased]

### Added
- A public pantry in `pantry/`: a dated competitor map, X mine, people mine and pantry queue, every row cited, plus templates for the next run.
- `pantry/MENU.md`, generated from the newest pantry queue by the menu script, which orders the Goal atoms and names one as up next.
- Two issue forms with matching labels: `routing-miss`, for when Claude picks the wrong agent or skill, and `plugin-proposal`, for a new plugin, agent, skill or command.
- A Ways to contribute section in CONTRIBUTING.md (Menu items, routing misses, plugin proposals, translations, sharing builds, and how to test a change locally), and a Contribute section in the README.

## [1.0.0] - 2026-09-30

This release makes the pack installable. Before it, `setup.sh` copied folders into `~/.claude/plugins`, where Claude Code does not load plugins from, and the agents and commands sat in a nested layout Claude Code does not read, so none of the 20 plugins loaded. Now every plugin installs through the Claude Code plugin system, and every agent, command, and skill is discovered and routed.

### Added
- `.claude-plugin/marketplace.json` at the root and a `plugin.json` in every plugin: the repo is now the `libre-mobiledev` marketplace. Install with `/plugin marketplace add HermeticOrmus/LibreMobileDev-Claude-Code`, then `/plugin install <plugin>@libre-mobiledev`.
- `libre-mobiledev-hooks`, an optional plugin that wires the pack's hook scripts into Claude Code. It asks before Claude touches signing keys, keystores, `key.properties`, `.p8` keys, provisioning profiles, `.env` files, credentials, or Firebase config, and before `rm -rf`, force pushes, hard resets, or `fastlane match nuke`. It warns when a write leaves a file empty, reminds Claude once per session to run tests after changing mobile source, and names the detected mobile platforms at session start.
- An `argument-hint` on every command, listing its actions and platform flags.
- CI (`.github/workflows/validate.yml`) that validates the marketplace and every plugin, then installs all of them into a clean config, on every push to main and every pull request.
- A feedback issue form and a Feedback section in the README.
- A Command column in the README plugin tables, so each plugin's slash command is visible.

### Changed
- Agents moved from `agents/<name>/AGENT.md` to `agents/<name>.md`, commands from `commands/<name>/COMMAND.md` to `commands/<name>.md`, and loose skill files into `skills/<name>/SKILL.md`, the layout Claude Code loads. File content is unchanged apart from new frontmatter.
- Every agent, command, and skill has a routing description that says when to use it. Every plugin has a one-sentence description, the same in `plugin.json` and in the marketplace.
- Agents use `model: inherit`, so they run on the model you picked. `flutter-engineer` was pinned to `sonnet` before.
- `setup.sh` installs through the Claude Code CLI and supports `--list`, `--only`, `--scope`, and `--uninstall`. `--plugins-dir` is still accepted but no longer used.
- `flutter-development` carried two generations of each file. The `flutter-developer` agent is merged into `flutter-engineer`, the older `/flutter` command file into the current one, and the `flutter-patterns` skill into `flutter-development`. Every section survived: the three-tree rendering model, Riverpod provider types, BLoC, Dart 3 features, CustomPainter, the create, state, paint, and optimize actions, and all code samples.
- The repo-level `hooks/` scripts moved into `plugins/libre-mobiledev-hooks/hooks/` and now read Claude Code's JSON input on stdin. They no longer write log files.
- QUICK_START and TROUBLESHOOTING show the Claude Code install path, check an install with `claude plugin list`, and name the real slash commands.

### Fixed
- None of the plugins loaded after `./setup.sh`. They load now.
- The hook scripts read `$1` and `$2`, which Claude Code never sets, and were never registered. They run now, once `libre-mobiledev-hooks` is installed.

### Upgrading from 0.2.0
- Run `./setup.sh` again (or `/plugin install <plugin>@libre-mobiledev`), restart Claude Code, then delete the old copies with `rm -rf ~/.claude/plugins/libre-mobiledev-*`.
- If you called the `flutter-developer` agent or the `flutter-patterns` skill by name, use `flutter-engineer` and `flutter-development` instead.

## [0.2.0] — 2026-05-23
- LibreUIUX doc chrome
- **flutter-development** depth-complete
- 3-tier learning paths
- 20 plugins: 1 depth-complete, 19 shell-improved

### v0.3-v0.5 priorities
- v0.3: react-native, swift-ios, kotlin-android
- v0.4: mobile-performance, mobile-testing, mobile-ci-cd
- v0.5: mobile-security, push-notifications, offline-first

## [0.1.0]
20 plugin shells. Initial release.
