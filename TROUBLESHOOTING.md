# Troubleshooting

```bash
ls ~/.claude/plugins/ | grep -c '^libre-mobiledev-'  # should print 20
```

## Common scenarios
- Flutter state management decision → `/flutter`
- App rejection on store review → `/app-store-optimization` (v0.4)
- Jank / 60fps issues → `/mobile-performance` (v0.4)
- Push notification deep links → `/push-notifications` + `/deep-linking` (v0.4)
- OWASP Mobile Top 10 → `/mobile-security` (v0.5)
