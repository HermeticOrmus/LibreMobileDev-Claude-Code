# /mobile-perf

Profile and optimize iOS, Android, and Flutter apps for frame rate, launch time, memory, and battery.

## Trigger

`/mobile-perf [action] [options]`

## Actions

- `profile` - Interpret profiler output and identify hotspots
- `launch` - Measure and optimize app launch time
- `memory` - Diagnose memory growth, leaks, and excessive allocation
- `render` - Fix frame drops and UI jank

## Options

- `--ios` - iOS Instruments (Time Profiler, Allocations, Core Animation)
- `--android` - Android Profiler, Systrace, StrictMode
- `--flutter` - Flutter DevTools, Performance view, Widget Rebuild Stats
- `--target <hz>` - Frame rate target: 60, 90, 120 (default: 60)

## Process

### profile
1. Read Instruments Time Profiler output (Invert Call Tree + Hide System Libraries)
2. Identify heaviest app-owned methods by self-time
3. Classify bottleneck: CPU-bound / memory-bound / GPU-bound / I/O-bound
4. Suggest targeted fix per root cause

### launch
1. iOS: use Application Launch Instruments template — shows pre-main, main, first frame
2. Identify slow `+load` methods — replace with `+initialize` or lazy singletons
3. Count dylib dependencies — reduce to under 6 dynamic frameworks
4. Defer non-critical work to `DispatchQueue.main.async { }` after first frame
5. Android: use Perfetto or StartupTracing; generate Baseline Profile

### memory
1. iOS Allocations instrument: "Generation Analysis" — snapshot before/after action
2. Identify abandoned memory — allocations not released after user action completes
3. iOS Leaks instrument: detect circular retain cycles in delegate/closure patterns
4. Android: heap dump via Memory Profiler → Retained Size sorted descending
5. Image memory: verify all images are downsampled to display size, not full resolution

### render
1. Flutter DevTools Performance view — identify red frames (> 16ms at 60fps)
2. Widget Rebuild Stats — count rebuilds per widget per second
3. iOS Core Animation instrument — red frames, "Color Offscreen-Rendered Yellow"
4. Android GPU Profiler / "Profile GPU Rendering" in Developer Options
5. Fix: move work off main thread, reduce overdraw, use RepaintBoundary / layer rasterization

## Output

```
## Performance Analysis

### Bottleneck Identified
Type: [CPU / Memory / Rendering / I/O / Network]
Platform: [iOS / Android / Flutter]
Symptom: [description]
Measured: [frame time / memory delta / launch time]

### Root Cause
[Specific call, widget, or operation causing the issue]

### Fix
[Code change with explanation of why it helps]

### Expected Improvement
[Before/after estimate — e.g., 28ms → 11ms frame time]
```

## Examples

```bash
# Flutter frame drop investigation
/mobile-perf render --flutter --target 60

# iOS app launch over 400ms
/mobile-perf launch --ios

# Android memory growth in RecyclerView screen
/mobile-perf memory --android

# Interpret Instruments Time Profiler callstack
/mobile-perf profile --ios
```
