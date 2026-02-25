<p align="center">
  <strong>LibreMobileDev-Claude-Code</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/plugins-20-859900?style=flat-square" alt="20 Plugins" />
  <img src="https://img.shields.io/badge/license-MIT-859900?style=flat-square" alt="MIT License" />
  <img src="https://img.shields.io/badge/claude--code-plugins-859900?style=flat-square" alt="Claude Code Plugins" />
  <img src="https://img.shields.io/badge/mobile-dev-859900?style=flat-square" alt="Mobile Dev" />
</p>

---

A curated collection of Claude Code plugins for mobile app development. From Flutter to Swift, React Native to Kotlin, covering the full mobile lifecycle from architecture to app store.

---

## Plugins

| # | Plugin | Description | Category |
|---|--------|-------------|----------|
| 1 | [accessibility-mobile](plugins/accessibility-mobile/) | VoiceOver, TalkBack, semantic markup, WCAG compliance | `a11y` `ux` |
| 2 | [app-store-optimization](plugins/app-store-optimization/) | ASO, metadata, screenshots, A/B testing, ratings strategy | `marketing` `aso` |
| 3 | [camera-media](plugins/camera-media/) | Camera APIs, photo/video capture, image processing, filters | `media` `hardware` |
| 4 | [cross-platform-patterns](plugins/cross-platform-patterns/) | Shared code, platform channels, conditional rendering | `architecture` `cross-platform` |
| 5 | [deep-linking](plugins/deep-linking/) | Universal links, app links, deferred deep links, navigation | `navigation` `linking` |
| 6 | [flutter-development](plugins/flutter-development/) | Flutter widgets, Dart, state management, packages | `flutter` `dart` |
| 7 | [gesture-interaction](plugins/gesture-interaction/) | Touch gestures, haptics, motion, custom gesture recognizers | `ux` `interaction` |
| 8 | [kotlin-android](plugins/kotlin-android/) | Kotlin, Jetpack Compose, Android SDK, lifecycle management | `android` `kotlin` |
| 9 | [location-services](plugins/location-services/) | GPS, geofencing, maps, location tracking, geocoding | `location` `hardware` |
| 10 | [mobile-analytics](plugins/mobile-analytics/) | Event tracking, crash reporting, user analytics, funnels | `analytics` `telemetry` |
| 11 | [mobile-architecture](plugins/mobile-architecture/) | MVVM, Clean Architecture, BLoC, Redux for mobile | `architecture` `patterns` |
| 12 | [mobile-ci-cd](plugins/mobile-ci-cd/) | Fastlane, Bitrise, App Center, code signing, distribution | `devops` `ci-cd` |
| 13 | [mobile-payments](plugins/mobile-payments/) | In-app purchases, subscriptions, payment gateways | `payments` `monetization` |
| 14 | [mobile-performance](plugins/mobile-performance/) | Launch time, memory, battery, network, UI jank optimization | `performance` `optimization` |
| 15 | [mobile-security](plugins/mobile-security/) | Secure storage, cert pinning, biometrics, obfuscation | `security` `privacy` |
| 16 | [mobile-testing](plugins/mobile-testing/) | Widget tests, integration tests, UI automation, device farms | `testing` `qa` |
| 17 | [offline-first](plugins/offline-first/) | Local databases, sync strategies, conflict resolution, caching | `data` `offline` |
| 18 | [push-notifications](plugins/push-notifications/) | FCM, APNs, notification channels, rich notifications | `notifications` `messaging` |
| 19 | [react-native](plugins/react-native/) | React Native components, navigation, native modules, Expo | `react-native` `javascript` |
| 20 | [swift-ios](plugins/swift-ios/) | Swift, SwiftUI, UIKit, Combine, iOS SDK | `ios` `swift` |

## Quick Start

1. **Clone the repository**
   ```bash
   git clone https://github.com/HermeticOrmus/LibreMobileDev-Claude-Code.git
   ```

2. **Copy a plugin into your project**
   ```bash
   # Copy the Flutter plugin's CLAUDE.md agent into your project
   cp plugins/flutter-development/agents/flutter-developer/AGENT.md your-project/.claude/agents/

   # Or copy a command
   cp plugins/mobile-testing/commands/mobile-test/COMMAND.md your-project/.claude/commands/
   ```

3. **Use the learning paths**
   ```bash
   # Start with the beginner path if you are new to mobile
   cat learning-paths/beginner.md
   ```

4. **Set up hooks** (optional)
   ```bash
   cp hooks/session-start.sh your-project/.claude/hooks/
   cp hooks/pre-tool-use.sh your-project/.claude/hooks/
   cp hooks/post-tool-use.sh your-project/.claude/hooks/
   ```

## Architecture

```
LibreMobileDev-Claude-Code/
├── plugins/                    # 20 mobile dev plugins
│   └── {plugin-name}/
│       ├── README.md           # Plugin overview and usage
│       ├── agents/             # Agent definitions (AGENT.md)
│       ├── commands/           # Command definitions (COMMAND.md)
│       └── skills/             # Skill definitions (SKILL.md)
├── learning-paths/             # Structured learning progressions
│   ├── beginner.md             # Mobile fundamentals
│   ├── intermediate.md         # State, APIs, testing
│   └── advanced.md             # Performance, CI/CD, architecture
├── hooks/                      # Session and tool hooks
│   ├── session-start.sh        # Framework detection
│   ├── pre-tool-use.sh         # Compatibility checks
│   └── post-tool-use.sh        # Build verification
├── templates/                  # Project templates
│   └── CLAUDE.md               # Mobile dev project template
├── CONTRIBUTING.md             # How to contribute plugins
├── CODE_OF_CONDUCT.md          # Contributor Covenant v2.1
├── CHANGELOG.md                # Release history
└── LICENSE                     # MIT License
```

Each plugin follows the **Agent / Command / Skill** pattern:
- **Agents** define a specialist persona with deep domain expertise
- **Commands** provide structured triggers for common workflows
- **Skills** encode reusable patterns, anti-patterns, and references

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on adding or improving plugins.

## License

[MIT](LICENSE) -- Copyright (c) 2025-2026 Hermetic Ormus
