# /mobile-cicd

Set up Fastlane lanes, GitHub Actions workflows, code signing, and distribution pipelines.

## Trigger

`/mobile-cicd [action] [options]`

## Actions

- `setup` - Scaffold Fastfile, Appfile, Gemfile for a project
- `sign` - Configure code signing (iOS match, Android keystore)
- `distribute` - TestFlight, Firebase App Distribution, or Google Play upload lane
- `release` - Full App Store / Google Play production release lane

## Options

- `--ios` - iOS Fastlane + GitHub Actions
- `--android` - Android Fastlane + GitHub Actions
- `--both` - Parallel iOS + Android workflow
- `--ci <service>` - github-actions, bitrise (default: github-actions)
- `--distribution <target>` - testflight, firebase, play-internal, play-production

## Process

### setup
Output:
```
Gemfile           — bundler, fastlane gem
fastlane/Appfile  — bundle_id, team_id, package_name
fastlane/Fastfile — test, beta, release lanes skeleton
```

### sign
iOS:
1. `fastlane match init` command to set up git-based storage
2. `match(type: "appstore", readonly: is_ci)` lane configuration
3. Required secrets: `MATCH_PASSWORD`, `MATCH_GIT_BASIC_AUTHORIZATION`

Android:
1. Keystore generation command
2. Gradle signing config reading from env vars
3. CI step to decode base64 keystore and write to temp file

### distribute
Output complete distribution lane:
- Build step: `build_app` (iOS) or `gradle(task: "bundle")` (Android)
- Upload step: `pilot` (TestFlight) / `firebase_app_distribution` / `upload_to_play_store`
- Build number auto-increment from `${{ github.run_number }}`

### release
Full production lane:
- Version bump
- Changelog prompt (or read from CHANGELOG.md)
- Build + sign
- Submit for review (iOS `deliver` with `submit_for_review: true`)
- Track promotion (Android `upload_to_play_store(track: "production")`)

## Output

```
## CI/CD Configuration

### Secrets to Configure in GitHub/Bitrise
[Table of required secrets]

### fastlane/Fastfile
[Complete Fastfile]

### .github/workflows/mobile.yml
[Complete workflow YAML]
```

## Examples

```bash
# Set up Fastlane for new iOS project
/mobile-cicd setup --ios

# Configure code signing with match
/mobile-cicd sign --ios

# TestFlight beta distribution lane
/mobile-cicd distribute --ios --distribution testflight

# Full iOS + Android CI pipeline
/mobile-cicd setup --both --ci github-actions

# Google Play internal track
/mobile-cicd distribute --android --distribution play-internal
```
