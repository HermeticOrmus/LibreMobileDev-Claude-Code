# Intermediate — stores + CI/CD + analytics

## Store certification

- **App Store**: review takes 1-3 days typically; rejections common for first submission
- **Play Store**: faster review (hours), stricter automated content review
- **Both**: privacy labels mandatory, in-app purchase routing through platform IAP

## CI/CD

- **Fastlane** for the canonical signing + upload flow (still the standard)
- **Codemagic / Bitrise** for hosted CI
- **GitHub Actions** with mobile workflow templates
- Signing certificates: rotate carefully, never commit, use match for team sharing

## Analytics + privacy

- Mixpanel, Amplitude, Firebase Analytics — proprietary
- PostHog, Plausible — privacy-respecting alternatives
- ATT (App Tracking Transparency) prompt required for iOS cross-app tracking
- Data Safety section required for Play Store

## Next: [Advanced](advanced.md)
