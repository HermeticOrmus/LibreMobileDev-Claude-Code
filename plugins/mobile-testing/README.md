# Mobile Testing

XCTest, XCUITest, Espresso, Compose testing, Flutter widget/integration tests, Detox, Firebase Test Lab, golden screenshot regression.

## What's Included

### Agents
- **mobile-test-engineer** - Expert in iOS/Android/Flutter testing pyramids, async test patterns, UI automation, device farms, and golden testing

### Commands
- `/mobile-test` - Write tests at any layer: `unit`, `ui`, `golden`, `cloud`

### Skills
- **mobile-testing-patterns** - XCTest async/await with mocks, XCUITest checkout flow, Espresso with Compose, Flutter widget test with Riverpod overrides, Flutter integration test, golden test with matchesGoldenFile

## Quick Start

```bash
# iOS unit tests with async/await
/mobile-test unit --ios

# Compose UI tests
/mobile-test ui --android

# Flutter golden screenshot regression
/mobile-test golden --flutter

# Firebase Test Lab matrix run
/mobile-test cloud --android
```

## Testing Pyramid

```
          [Device Farm]          ← real devices, OS matrix, pre-release
        [Integration Tests]      ← end-to-end flows, simulator/emulator
      [Widget / Component Tests] ← individual screen with mocked deps
    [Unit Tests]                 ← business logic, ViewModels, parsers
```

## Test Framework Reference

| Layer | iOS | Android | Flutter | React Native |
|-------|-----|---------|---------|--------------|
| Unit | XCTest | JUnit5 + MockK | dart:test | Jest |
| Component | XCTest (no device) | Robolectric | widget test | React Native Testing Library |
| UI | XCUITest | Espresso / Compose | integration_test | Detox |
| Device Farm | Firebase Test Lab | Firebase Test Lab | Firebase Test Lab | Sauce Labs |

## Critical Rules

- Set `continueAfterFailure = false` in XCUITest — don't run steps after first failure
- Use `accessibilityIdentifier` (iOS) and `testTag` (Flutter) — not text labels that change with localization
- Inject `--uitesting` launch argument to disable animations and mock network in UI tests
- Never call `Thread.sleep` in tests — use `XCTNSPredicateExpectation`, `waitForExistence`, or `pumpAndSettle`
- Store golden files in git; update with `flutter test --update-goldens` only on intentional design changes
