# Mobile CI/CD

Fastlane, GitHub Actions, code signing (iOS match, Android keystore), TestFlight, Firebase App Distribution, Google Play.

## What's Included

### Agents
- **mobile-cicd-engineer** - Expert in Fastlane lanes, match for certificate management, App Store Connect API, GitHub Actions matrix builds, build number automation

### Commands
- `/mobile-cicd` - Set up Fastlane, configure signing, build distribution lanes, create CI workflows

### Skills
- **mobile-cicd-patterns** - iOS Fastfile with match, Android Fastfile with Gradle signing, GitHub Actions matrix YAML, required secrets table

## Quick Start

```bash
# Full iOS + Android CI pipeline
/mobile-cicd setup --both --ci github-actions

# iOS code signing with match
/mobile-cicd sign --ios

# TestFlight beta on every main push
/mobile-cicd distribute --ios --distribution testflight
```

## Required Secrets

### iOS
| Secret | Description |
|--------|-------------|
| `APP_STORE_KEY_ID` | App Store Connect API key ID |
| `APP_STORE_ISSUER_ID` | App Store Connect issuer ID |
| `APP_STORE_KEY_CONTENT` | .p8 key content (base64) |
| `MATCH_PASSWORD` | match repo encryption password |
| `MATCH_GIT_BASIC_AUTHORIZATION` | base64 `user:token` |

### Android
| Secret | Description |
|--------|-------------|
| `KEYSTORE_BASE64` | Base64-encoded keystore file |
| `KEYSTORE_PASSWORD` | Keystore password |
| `KEY_ALIAS` | Signing key alias |
| `KEY_PASSWORD` | Key password |
| `PLAY_STORE_JSON_KEY` | Google Play service account JSON |

## Key Rules

- `match(readonly: true)` in CI — never regenerate certs in automated pipelines
- Keystore files must never be committed to the repo — always decode from env
- Build numbers from `${{ github.run_number }}` for monotonically increasing values
- Cache Gradle dependencies and Ruby gems — saves 3-5 minutes per build run
