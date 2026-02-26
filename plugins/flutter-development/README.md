# Flutter Development

Flutter widgets, Dart, state management (Riverpod, BLoC), custom painter, platform channels, Dart isolates.

## What's Included

### Agents
- **flutter-developer** - Expert in widget tree, Riverpod providers, BLoC pattern, CustomPainter Canvas API, Flutter rendering pipeline, isolates for heavy work

### Commands
- `/flutter` - Create widgets, implement state, paint custom visuals, optimize rebuilds

### Skills
- **flutter-patterns** - Riverpod StateNotifierProvider, BLoC event/state, CustomPainter, isolate compute(), rebuild optimization with select()

## Quick Start

```bash
# Scaffold a Riverpod-managed feature
/flutter create --riverpod --feature cart

# Implement BLoC for authentication
/flutter state --bloc --feature auth

# Custom painter for data visualization
/flutter paint --feature waveform

# Fix excessive rebuilds
/flutter optimize
```

## State Management Comparison

| | Riverpod | BLoC | Provider |
|---|---------|------|----------|
| Learning curve | Medium | Medium-High | Low |
| Testability | Excellent | Excellent | Good |
| Async support | Built-in (FutureProvider) | Manual | Manual |
| Recommended for | New projects | Event-heavy flows | Legacy |
| Type safety | Full | Full | Full |

## Key Rules

- `const` constructors wherever possible — eliminates rebuilds
- `ref.watch(provider.select(...))` narrows rebuild scope
- Never put business logic in `build()` methods
- Use `ListView.builder` for any list with more than ~20 items
- Background work goes in `compute()` or `Isolate.run()`
