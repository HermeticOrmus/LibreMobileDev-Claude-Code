# Deep Linking

iOS Universal Links, Android App Links, custom URL schemes, deferred deep linking, in-app routing.

## What's Included

### Agents
- **deep-link-engineer** - Expert in AASA files, assetlinks.json, intent-filters, Flutter go_router, Branch.io/Firebase deferred linking, link testing with adb and xcrun

### Commands
- `/deep-link` - Configure server files, implement handling, test, and debug deep links

### Skills
- **deep-link-patterns** - AASA JSON, assetlinks.json, iOS Swift handling, Android Kotlin handling, Flutter app_links + go_router, Branch.io deferred linking, adb/xcrun test commands

## Quick Start

```bash
# Configure Universal Links and App Links for product pages
/deep-link configure --ios --android --url "https://myapp.com/product/:id"

# Test your configured deep links
/deep-link test --url "https://myapp.com/product/123"

# Debug why Universal Links aren't working
/deep-link debug --ios
```

## Server Files Required

| Platform | File | URL |
|----------|------|-----|
| iOS | apple-app-site-association | `https://domain/.well-known/apple-app-site-association` |
| Android | assetlinks.json | `https://domain/.well-known/assetlinks.json` |

Both must be served over HTTPS, with no redirect, with correct Content-Type.

## Common Pitfalls

- AASA file cached by Apple's CDN — changes may take up to 24h after app install
- `android:autoVerify="true"` must be set; verify with `adb shell pm get-app-links`
- Custom URL schemes are not verified — use Universal/App Links for auth flows
- AASA TeamID format: `TEAMID.com.bundle.id` (not just bundle ID)
