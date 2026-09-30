# Menu: LibreMobileDev-Claude-Code

Queue: 2026-09-30-pantry-queue.md
Counts: open 7, in flight 0, shipped 0, parked 0, dropped 0, needs fixing 0

## Steer

- none

## Up next

**device-loop**: Add a `device-loop` skill that builds, runs and screenshots from the CLI (queue #1, high, repo, since 2026-09-30)

- Done when: `claude plugin validate plugins/mobile-testing` passes; `claude plugin details mobile-testing@libre-mobiledev` lists skill `device-loop`; its SKILL.md gives copy-paste commands to build, install, launch and screenshot with `xcodebuild` plus `xcrun simctl` (iOS), `./gradlew` plus `adb` (Android), `flutter run` and `npx expo run:ios` / `run:android`, and a section on adding mobile-mcp or MobileBuildMCP as an optional MCP server with its install command
- Verify on: repo
- Evidence: Matrix: "Build and run on simulator, emulator or device from the agent" and "UI inspection, screenshots, tap automation" (Us N; Expo, AndroidOff, MBM, CCSim Y). Map: mobile-mcp, MobileBuildMCP, Callstack agent-device. X: PaulSolt, zeeg, EastlondonDev praise for build and run; camsoft2000 on agents defaulting to the plain CLI
- Issue: none yet (promote after merge)
- Order: device-loop, hooks-test, store-privacy, masvs, material-3, swiftui-deprecations, flutter-evals
- Tie: device-loop over hooks-test, store-privacy, by key order (jev off)

## Atoms

| Key | Title | State | Confidence | Class | Since | Queue # | Issue | Because |
|-----|-------|-------|------------|-------|-------|---------|-------|---------|
| device-loop | Add a `device-loop` skill that builds, runs and screenshots from the CLI | open | high | repo | 2026-09-30 | 1 | - | - |
| flutter-evals | Add a `flutter-evals` suite for flutter-development | open | low | eval | 2026-09-30 | 7 | - | - |
| hooks-test | Test the hook scripts with a `hooks-test` script in CI | open | high | repo | 2026-09-30 | 2 | - | - |
| masvs | Map mobile-security findings to OWASP `masvs` control IDs | open | medium | repo | 2026-09-30 | 4 | - | - |
| material-3 | Add `material-3` theming to the kotlin-android skill | open | medium | repo | 2026-09-30 | 6 | - | - |
| store-privacy | Add a `store-privacy` skill for privacy manifests, ATT and Play Data safety | open | high | repo | 2026-09-30 | 3 | - | - |
| swiftui-deprecations | Add a `swiftui-deprecations` table to the swift-ios skill | open | medium | repo | 2026-09-30 | 5 | - | - |

## Retired

| Key | Title | State | Since | Issue | Because |
|-----|-------|-------|-------|-------|---------|
| none | | | | | |

## Notes

- none
