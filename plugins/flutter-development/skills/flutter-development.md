# Flutter development pattern library

## State management 2026 reference

| Library | Verdict |
|---|---|
| Riverpod 2.x | Default for new projects |
| BLoC | Solid if team prefers events/streams |
| Provider | Still fine; Riverpod's predecessor |
| GetX | Avoid; too magical |
| Redux | Overkill |
| `setState` | Widget-local only |

## Const cookbook

```dart
const SizedBox(height: 16),
const Divider(),
const Text('Static label'),

// Lints to enable:
// - prefer_const_constructors
// - prefer_const_literals_to_create_immutables
// - prefer_const_declarations
```

## Performance checklist

- `flutter run --profile` for real measurements
- ListView.builder over ListView(children:[...])
- AnimatedOpacity not Opacity
- compute() / isolates for parse/math
- const widgets aggressively
- Image.network with proper cacheWidth/cacheHeight
- Avoid saveLayer (Opacity, ShaderMask, ColorFilter cause it)

## Common failures

### "App is janky"
- Profile in profile mode (not debug)
- Check raster thread vs UI thread in DevTools
- Look for saveLayer triggers
- Move heavy parsing to compute() / isolate

### "Memory grows over time"
- Listeners not disposed (StreamSubscription, AnimationController)
- Images not evicted from cache
- Static references to BuildContext

### "Tests are flaky"
- Use `pumpAndSettle` for animations
- Mock time-dependent state
- WidgetTester.pump(duration) is more controllable than pumpAndSettle

## Platform integration

Pigeon for everything. Hand-coded MethodChannel for trivial calls only.

## Cross-references
- `mobile-architecture` for MVVM/BLoC/clean
- `mobile-performance` for profiling
- `mobile-testing` for test strategy
- `mobile-ci-cd` for build automation
