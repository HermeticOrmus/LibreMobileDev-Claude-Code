# /deep-link

Configure Universal Links, App Links, custom schemes, routing, and deferred deep linking.

## Trigger

`/deep-link [action] [options]`

## Actions

- `configure` - Generate AASA, assetlinks.json, entitlements, and Manifest entries
- `test` - Generate platform test commands for a given URL
- `handle` - Implement in-app route handling for a given URL pattern
- `debug` - Diagnose why a deep link isn't working

## Options

- `--ios` - iOS Universal Links focus
- `--android` - Android App Links focus
- `--flutter` - Flutter go_router handling
- `--url <pattern>` - Specify URL pattern (e.g. `https://myapp.com/product/:id`)
- `--deferred` - Include Branch.io or Firebase Dynamic Links deferred linking

## Process

### configure
1. Parse provided URL pattern
2. Generate AASA JSON (iOS) with correct `components` format
3. Generate assetlinks.json (Android) — prompt for Team ID + Bundle ID, Package + SHA-256
4. Generate Xcode entitlement entry
5. Generate AndroidManifest intent-filter XML
6. Output server deployment instructions

### test
Generate ready-to-run test commands:
```bash
# iOS Simulator
xcrun simctl openurl booted "[url]"

# Android ADB
adb shell am start -W -a android.intent.action.VIEW -d "[url]" [package]

# Verify Android App Link verification status
adb shell pm get-app-links [package]

# Check AASA server file
curl -I https://[domain]/.well-known/apple-app-site-association
```

### handle
Output routing code for the URL pattern:
- iOS: `URLComponents` parsing + Navigation call
- Android: `intent.data` parsing + Fragment/Activity navigation
- Flutter: `go_router` `GoRoute` with `pathParameters` extraction

### debug
Step-by-step diagnosis checklist:
- [ ] AASA served correctly (no redirect, correct Content-Type, valid JSON)
- [ ] AASA cached by Apple CDN (check with `curl -I`)
- [ ] App entitlement includes domain with `applinks:` prefix
- [ ] entitlement matches exactly — no trailing slash, no `www` mismatch
- [ ] assetlinks.json SHA-256 matches production signing certificate
- [ ] `android:autoVerify="true"` set on intent-filter
- [ ] App Links verified (check with `adb shell pm get-app-links`)
- [ ] Link was triggered from external app (direct address bar entry may not trigger)

## Examples

```bash
# Configure iOS Universal Links for product pages
/deep-link configure --ios --url "https://myapp.com/product/:id"

# Configure both platforms simultaneously
/deep-link configure --ios --android --url "https://myapp.com/product/:id"

# Test deep links on both platforms
/deep-link test --url "https://myapp.com/product/123"

# Implement Flutter route handler
/deep-link handle --flutter --url "https://myapp.com/product/:id"

# Debug Universal Links not working
/deep-link debug --ios
```
