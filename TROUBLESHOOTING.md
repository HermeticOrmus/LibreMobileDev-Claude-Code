# Troubleshooting

```bash
claude plugin list | grep -c '@libre-mobiledev'  # 21 after a full ./setup.sh run (20 plugins plus libre-mobiledev-hooks)
```

## Plugins installed but nothing loads
- Restart Claude Code after installing; plugins load at session start.
- Before v1.0.0, `setup.sh` copied folders to `~/.claude/plugins/libre-mobiledev-*`. Claude Code does not load plugins from there. Run the new `./setup.sh` (or `/plugin install <plugin>@libre-mobiledev`), then delete the old copies with `rm -rf ~/.claude/plugins/libre-mobiledev-*`.
- `claude plugin details <plugin>@libre-mobiledev` lists the agents, commands, and skills a plugin loaded.

## Hooks do nothing
`libre-mobiledev-hooks` reads its input with `jq`. Install `jq`, restart Claude Code, and run `/hooks` to confirm the SessionStart, PreToolUse, and PostToolUse entries are registered.

## Common scenarios
- Flutter state management decision → `/flutter`
- App rejection on store review → `/aso`
- Jank / 60fps issues → `/mobile-perf`
- Push notification deep links → `/push` + `/deep-link`
- OWASP Mobile Top 10 → `/mobile-sec`
