# /flutter

Flutter widget creation, state management, custom painting, and performance optimization.

## Trigger

`/flutter [action] [options]`

## Actions

- `create` - Scaffold a new widget with appropriate state management
- `state` - Implement or migrate state management (Riverpod, BLoC)
- `paint` - Implement a CustomPainter for a described visual effect
- `optimize` - Profile and fix rebuild/render performance issues

## Options

- `--riverpod` - Use Riverpod (default for new code)
- `--bloc` - Use BLoC pattern
- `--provider` - Use Provider (legacy)
- `--feature <name>` - Feature context for the implementation

## Process

### create
1. Determine state requirements (stateless vs stateful vs state-managed)
2. Scaffold widget with appropriate base class
3. Add `const` constructor and key parameter
4. Wire to state provider if needed
5. Include basic widget tests

### state
Output complete state implementation:
- State class (immutable, with `copyWith`)
- Notifier/Cubit/BLoC with methods
- Provider definition
- Usage in `ConsumerWidget` or `BlocBuilder`
- Provider scope setup in `main.dart`

### paint
1. Describe the visual
2. Output `CustomPainter` with `paint()` implementation
3. Include `shouldRepaint()` — only return true when relevant data changes
4. Wrap usage in `RepaintBoundary` if animated
5. Include size and constraints guidance

### optimize
Analyze provided widget tree and output:
- Identified rebuild causes (missing `const`, large `ref.watch` scope)
- Add `select()` to narrow watched state
- Move `const` constructors to eligible widgets
- Replace `Column` + `map()` with `ListView.builder` for lists
- Add `RepaintBoundary` where appropriate

## Output Format

```dart
// Widget code follows Flutter conventions:
// - Named constructors with key parameter
// - const where applicable
// - Separate state/logic from presentation
// - No business logic in build()
```

## Examples

```bash
# Create a stateful counter widget with Riverpod
/flutter create --riverpod --feature counter

# Implement auth state with BLoC
/flutter state --bloc --feature auth

# Paint a circular progress indicator with custom style
/flutter paint --feature circular-timer

# Fix slow list scrolling
/flutter optimize --feature product-list
```
