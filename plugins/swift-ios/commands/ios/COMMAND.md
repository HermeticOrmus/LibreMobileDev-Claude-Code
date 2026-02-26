# /ios

Build Swift/SwiftUI iOS features using modern APIs: async/await, actors, SwiftUI Layout, Combine, SwiftData.

## Trigger

`/ios [action] [options]`

## Actions

- `swiftui` - SwiftUI view, layout, navigation, animations
- `concurrency` - async/await, actors, AsyncStream, structured concurrency
- `combine` - Combine publisher pipelines for reactive data flow
- `build` - SPM dependencies, Xcode build settings, code signing

## Options

- `--ios16` - iOS 16 target (NavigationStack, Layout protocol)
- `--ios17` - iOS 17 target (@Observable, SwiftData, PhaseAnimator)
- `--ios18` - iOS 18 target (zoom transitions, RealityKit updates)
- `--uikit` - Include UIViewRepresentable bridge code
- `--combine` - Combine-based reactive pattern (vs async/await)

## Process

### swiftui
1. Identify SwiftUI equivalent for the UIKit pattern (if migrating)
2. Choose property wrapper: `@State` local, `@Binding` parent-owned, `@StateObject` lifecycle-bound
3. iOS 17+: `@Observable` class replaces `@ObservableObject` — simpler, more performant
4. Navigation: `NavigationStack` + `navigationDestination(for:)` for type-safe routing
5. Custom layout: `Layout` protocol for non-standard arrangements (flow layout, radial)
6. Prefer `.task { }` modifier over `onAppear` + `Task { }` — automatically cancelled on disappear

### concurrency
1. Mark ViewModel class `@MainActor` — all mutations safe for SwiftUI
2. Use `async let` for parallel independent fetches
3. Use `withTaskGroup` when number of concurrent tasks is dynamic
4. Replace delegate pattern with `AsyncStream` — easier to consume with `for await`
5. Actor for shared mutable state accessed from multiple tasks

### combine
1. Start with `@Published` property + `$property` publisher
2. `debounce` for search input (300ms), `throttle` for scroll events
3. `flatMap` to switch to a new publisher per emission (e.g., fetch on query change)
4. `catch` to recover from errors and emit empty/fallback value
5. `.store(in: &cancellables)` on all subscriptions; cancellables in object's lifecycle

### build
1. Add SPM dependency: File → Add Package Dependencies in Xcode 15+
2. `Package.swift` targets: separate between `Sources/` and `Tests/`
3. Build settings: `SWIFT_VERSION = 5.9`, `IPHONEOS_DEPLOYMENT_TARGET = 16.0`
4. Code signing: automatic signing for development; manual for CI (match / fastlane)
5. `#Preview` macro (Xcode 15+) replaces `PreviewProvider` struct

## Output

```
## iOS Implementation

### Model / Service Layer
[Actor or @Observable service with async methods]

### SwiftUI View
[View with appropriate property wrappers]

### UIKit Bridge (if needed)
[UIViewRepresentable with Coordinator]

### Dependencies
[SPM packages to add]
```

## Examples

```bash
# SwiftUI flow layout for tag chips
/ios swiftui --ios16

# Actor-based cache with AsyncStream live updates
/ios concurrency

# Combine search debounce pipeline
/ios combine

# SwiftData + @Observable for iOS 17
/ios swiftui --ios17

# UITextView wrapped for SwiftUI
/ios swiftui --uikit

# Structured concurrency with TaskGroup
/ios concurrency --ios16
```
