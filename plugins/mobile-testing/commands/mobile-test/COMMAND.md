# /mobile-test

Write unit tests, widget tests, UI automation, and configure device farm runs.

## Trigger

`/mobile-test [action] [options]`

## Actions

- `unit` - Generate unit tests for business logic, view models, repositories
- `ui` - Generate UI/integration tests for user flows
- `golden` - Screenshot regression tests for visual components
- `cloud` - Firebase Test Lab configuration for device matrix runs

## Options

- `--ios` - XCTest / XCUITest
- `--android` - Espresso / Compose test / Robolectric
- `--flutter` - Flutter widget test / integration_test
- `--rn` - Detox for React Native
- `--coverage` - Add coverage thresholds and reporting

## Process

### unit
1. Identify public API of the class under test
2. Create test file with `setUp` fixture and dependency mocks (protocol-based)
3. Happy path first, then error cases, then edge cases
4. Async: `async throws` test functions (Swift), `runTest { }` (Kotlin), `async` (Dart)
5. Assert on outputs, not on how the mock was called (behavior, not implementation)

### ui
1. Add `accessibilityIdentifier` / `testTag` / `contentDescription` to all interactive elements
2. Inject test mode via launch arguments — disable animations, mock network layer
3. Write flows from user perspective: tap, type, swipe, assert visible state
4. Never use `Thread.sleep` / `Task.sleep` — use proper waits and assertions
5. Reset app state in `setUp` — each test independent

### golden
1. Flutter: `matchesGoldenFile('path/name.png')` in widget test
2. iOS: `XCUIScreen.main.screenshot()` attached to `XCTAttachment`
3. Run `flutter test --update-goldens` to regenerate after intentional UI changes
4. Store goldens in version control; review diffs in PR

### cloud
1. Android: `gcloud firebase test android run` with `--device` matrix
2. iOS: `gcloud firebase test ios run` with `--device` model/version/locale
3. Robo test for smoke: no test code needed, crawls app automatically
4. Parse results: check for crash-free rate and test pass rate

## Output

```
## Test Suite

### Test File
[Complete test file with all cases]

### Mocks / Fakes
[Mock implementations needed]

### CI Integration
[GitHub Actions step or Fastlane scan lane]

### Coverage Notes
[What's tested, what's intentionally omitted]
```

## Examples

```bash
# XCTest async unit tests for AuthViewModel
/mobile-test unit --ios

# Espresso checkout flow test
/mobile-test ui --android

# Flutter golden tests for ProductCard component
/mobile-test golden --flutter

# Firebase Test Lab Android matrix config
/mobile-test cloud --android

# Flutter integration test for full onboarding flow
/mobile-test ui --flutter
```
