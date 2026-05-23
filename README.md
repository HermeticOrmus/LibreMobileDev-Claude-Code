<p align="center">
  <img src="https://ormus.solutions/mascot/chain_braces_to_swan.gif" alt="LibreMobileDev Claude Code" width="128" style="image-rendering: pixelated;" />
</p>

<h1 align="center">LibreMobileDev Claude Code</h1>

<p align="center">
  <em>Mobile app development with Claude Code — 20 plugins for Flutter, React Native, native iOS, native Android, and the operational layer between</em>
</p>

<p align="center">
  <a href="https://github.com/HermeticOrmus/LibreMobileDev-Claude-Code/stargazers"><img src="https://img.shields.io/github/stars/HermeticOrmus/LibreMobileDev-Claude-Code?style=flat-square&color=aa8142" alt="Stars" /></a>
  <img src="https://img.shields.io/badge/Mobile-aa8142?style=flat-square&logo=flutter&logoColor=white" alt="Mobile" />
  <img src="https://img.shields.io/badge/Claude_Code-aa8142?style=flat-square&logo=anthropic&logoColor=white" alt="Claude Code" />
</p>

---

> **Skills, agents, commands, and workflows for mobile app development with Claude Code.**

Mobile is unforgiving. A single store rejection can delay launch by weeks. A memory leak ships to millions of users before you notice. Cross-platform engineering decisions (Flutter? React Native? Native?) lock in years of decisions. **LibreMobileDev gives Claude Code the mobile-specific expertise that web-focused AI coding lacks.**

Twenty plugins covering Flutter, React Native, native iOS (Swift/SwiftUI), native Android (Kotlin/Jetpack Compose), plus the operational layer (CI/CD, store optimization, payments, security, performance).

## The 20 plugins

### Frameworks

| Plugin | Domain |
|---|---|
| **flutter-development** ⭐ | Flutter 3.x, widgets, state management, platform channels, build modes |
| react-native | RN 0.7x+, new architecture (Fabric), navigation, native modules |
| swift-ios | SwiftUI, UIKit, Combine, Core Data, App Intents |
| kotlin-android | Jetpack Compose, Coroutines, Hilt, Room, Material 3 |
| cross-platform-patterns | When to share code, when not to, common abstractions |

### Performance + quality

| Plugin | Domain |
|---|---|
| mobile-performance | Startup time, jank profiling, memory leaks, battery |
| mobile-testing | Unit, widget, integration, E2E across platforms |
| mobile-architecture | MVVM, BLoC, Riverpod, Redux, clean architecture |
| accessibility-mobile | Screen readers, color contrast, gesture alternatives, dynamic type |
| offline-first | Local-first storage, sync, conflict resolution |

### Features + integrations

| Plugin | Domain |
|---|---|
| push-notifications | FCM, APNs, deep linking from notification, rich notifications |
| deep-linking | URL schemes, universal links / App Links, App Banner |
| camera-media | Camera APIs, image picker, video recording, codecs |
| location-services | GPS, geofencing, background location (with permission discipline) |
| gesture-interaction | Touch, swipe, pinch, custom gesture recognizers |
| mobile-payments | Apple Pay, Google Pay, IAP, third-party (Stripe SDKs) |

### Ops + distribution

| Plugin | Domain |
|---|---|
| mobile-ci-cd | Fastlane, Codemagic, Bitrise, GitHub Actions for mobile, code signing |
| app-store-optimization | Keyword research, screenshots, store reviews, ratings management |
| mobile-analytics | Mixpanel, Amplitude, Firebase Analytics, privacy-respecting alternatives |
| mobile-security | Cert pinning, keychain/keystore, jailbreak/root detection, OWASP Mobile Top 10 |

⭐ = depth-complete. Remaining 19 shell-improved.

## Quick start

```bash
git clone https://github.com/HermeticOrmus/LibreMobileDev-Claude-Code.git ~/projects/LibreMobileDev-Claude-Code
cd ~/projects/LibreMobileDev-Claude-Code
./setup.sh
```

```
/flutter design a state management strategy for an app with ~50 screens, offline-first reads, online writes with conflict resolution, push notifications driving deep links into specific screens. Riverpod or BLoC?
```

See [QUICK_START.md](QUICK_START.md).

## Learning paths

- [Beginner](learning-paths/beginner.md) — mobile mindset, your first deployed app
- [Intermediate](learning-paths/intermediate.md) — store certification, CI/CD, analytics
- [Advanced](learning-paths/advanced.md) — offline-first, multi-platform code sharing, performance at scale

## Disclaimer

Building mobile apps for regulated domains has compliance requirements this kit doesn't replace (HIPAA, COPPA, GDPR consent). App Store + Play Store reviews enforce additional policies (privacy nutrition labels, ATT prompts, data safety section).

## License

MIT.
