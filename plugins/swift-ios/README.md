# Swift iOS

Swift concurrency (async/await, actors, AsyncStream), SwiftUI (ViewBuilder, PreferenceKey, Layout protocol), UIViewRepresentable, Combine, SwiftData, Swift Package Manager, Swift macros.

## What's Included

### Agents
- **ios-developer** - Expert in Swift 5.9+ concurrency, SwiftUI advanced patterns, UIKit bridging, Combine reactive pipelines, SwiftData, and SPM

### Commands
- `/ios` - Build iOS features: `swiftui`, `concurrency`, `combine`, `build`

### Skills
- **swift-ios-patterns** - Actor + AsyncStream for live data, PreferenceKey child-to-parent communication, Layout protocol for flow tags, UIViewRepresentable with Coordinator, Combine debounced search, SwiftData @Model + @Query

## Quick Start

```bash
# SwiftUI view with custom layout
/ios swiftui --ios16

# Actor-based data layer with async/await
/ios concurrency

# Combine search pipeline
/ios combine

# SwiftData persistence (iOS 17+)
/ios swiftui --ios17
```

## Property Wrapper Reference

| Wrapper | Owned By | Purpose |
|---------|----------|---------|
| `@State` | View | Local mutable state |
| `@Binding` | Parent | Two-way child binding |
| `@StateObject` | View | Object lifecycle (once) |
| `@ObservedObject` | Parent | External observed object |
| `@EnvironmentObject` | Hierarchy | DI via view tree |
| `@Observable` (iOS 17) | Class | Auto-tracking, replaces ObservableObject |
| `@Query` (SwiftData) | View | Live database fetch |

## Concurrency Decision Guide

| Need | Use |
|------|-----|
| One-shot async call | `async/await` |
| Parallel independent calls | `async let` |
| Dynamic number of parallel tasks | `withTaskGroup` |
| Shared mutable state, multiple callers | `actor` |
| Event stream (location, BLE) | `AsyncStream` |
| Reactive value pipeline | `Combine` or `AsyncPublisher` |
| UI-bound objects | `@MainActor` class |

## Critical Rules

- Mark ViewModel `@MainActor` — eliminates need for `DispatchQueue.main.async` in every method
- Use `.task { }` modifier not `onAppear + Task { }` — `.task` cancels automatically when view disappears
- Never call `MainActor.run { }` inside a `@MainActor`-isolated method — already on main
- `AsyncStream` continuation must call `finish()` when the underlying source ends
- Store `AnyCancellable` in `Set<AnyCancellable>` — not in local variable (would cancel immediately)
- `@Observable` (iOS 17) breaks `@ObservedObject` injection — use `@State` and pass by reference
