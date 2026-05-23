# Advanced — offline-first + multi-platform + perf at scale

## Offline-first

- Local SQLite (drift, Room) as source of truth
- Sync layer (custom or PowerSync / Replicache) for conflict resolution
- Optimistic UI with rollback on server reject
- Background sync via WorkManager (Android) / BackgroundTasks (iOS)

## Multi-platform code sharing

- Flutter: maximum sharing; some native code for platform features
- React Native: maximum sharing; native modules for performance/platform
- KMP (Kotlin Multiplatform): native UI + shared business logic
- Wasm via WebAssembly: emerging; consider for shared computation

Picking: native UX needs (KMP), max code share (Flutter/RN), web parity (Flutter Web), team familiarity (RN if web team).

## Performance at scale

- Startup time: lazy-load everything; defer non-critical
- Memory: image cache size, dispose patterns, weak references
- Battery: background work budget, location only when needed
- Network: HTTP/2 + connection reuse, compression, gzipped JSON

## What's still hard
- Cross-platform achieving native polish (still a gap)
- Truly offline-first sync with arbitrary conflict resolution
- Background work in the iOS sandbox (Apple keeps tightening)
