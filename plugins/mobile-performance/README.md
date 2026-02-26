# Mobile Performance

iOS Instruments, Android Profiler, Flutter DevTools, launch time, memory management, rendering at 60/120fps.

## What's Included

### Agents
- **mobile-perf-engineer** - Expert in profiling with Instruments, Android Profiler, and Flutter DevTools; identifies and fixes CPU, memory, rendering, and I/O bottlenecks

### Commands
- `/mobile-perf` - Profile, diagnose, and fix performance issues: `profile`, `launch`, `memory`, `render`

### Skills
- **mobile-perf-patterns** - Image downsampling with ImageIO, OS Signpost launch measurement, StrictMode for Android main thread violations, RecyclerView DiffUtil, Flutter RepaintBoundary and compute()

## Quick Start

```bash
# Diagnose Flutter frame drops
/mobile-perf render --flutter

# iOS launch time over 400ms
/mobile-perf launch --ios

# Android memory leak investigation
/mobile-perf memory --android

# Read a Time Profiler callstack
/mobile-perf profile --ios
```

## Frame Budget Reference

| Display | Frame budget | Target render time |
|---------|-------------|-------------------|
| 60 Hz | 16.67ms | < 12ms |
| 90 Hz | 11.11ms | < 9ms |
| 120 Hz (ProMotion) | 8.33ms | < 6ms |

## Profiling Tools by Platform

| Platform | CPU | Memory | Rendering | Launch |
|----------|-----|--------|-----------|--------|
| iOS | Instruments: Time Profiler | Allocations + Leaks | Core Animation | Application Launch template |
| Android | CPU Profiler (System Trace) | Memory Profiler + heap dump | GPU Profiler | Perfetto + StartupTracing |
| Flutter | DevTools: Timeline | DevTools: Memory | Performance view | Dart VM startup events |

## Critical Rules

- Measure before optimizing — never guess at bottlenecks
- Image downsampling is the single highest-ROI memory fix for photo-heavy apps
- Main thread I/O is the #1 source of Android jank — catch with StrictMode in debug builds
- Cold launch target: < 400ms to first frame on iOS, < 500ms on Android
- Flutter: `const` constructors are free; use everywhere to prevent unnecessary rebuilds
