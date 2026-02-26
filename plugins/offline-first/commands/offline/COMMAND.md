# /offline

Design offline-first data layers with local persistence, background sync, and conflict resolution.

## Trigger

`/offline [action] [options]`

## Actions

- `design` - Design local schema with sync metadata fields
- `sync` - Implement background sync worker with retry and conflict resolution
- `conflict` - Choose and implement a conflict resolution strategy
- `test` - Test offline behavior: network loss, conflict simulation

## Options

- `--ios` - Core Data / SwiftData + BGTaskScheduler
- `--android` - Room + WorkManager
- `--flutter` - Drift / Isar + workmanager
- `--strategy <type>` - Conflict strategy: lww, server-wins, client-wins, merge
- `--realtime` - Add network state monitor for immediate sync on reconnect

## Process

### design
1. Add sync metadata columns to every synced table: `id` (UUID), `updatedAt`, `syncStatus` (pending/synced/failed), `deletedAt` (soft delete)
2. Create pending queue view/query returning rows where syncStatus != 'synced'
3. Design DAO/Repository interface: write local first, trigger sync after write
4. Never use auto-increment IDs for synced records — use UUIDs generated client-side

### sync
1. iOS: register `BGProcessingTask` in AppDelegate; handle task in extension
2. Android: `CoroutineWorker` with `setConstraints(NetworkType.CONNECTED)`
3. Flutter: `workmanager` one-off task on data change; periodic task as fallback
4. Retry logic: `Result.retry()` (Android) / `BGTaskScheduler.submit()` (iOS) with exponential backoff
5. Mark sync success immediately when server confirms; handle 409/conflict separately

### conflict
1. **LWW**: compare `updatedAt` timestamps; highest timestamp wins — implement in sync worker
2. **Server wins**: on 409, fetch server version and overwrite local
3. **Three-way merge**: track `baseVersion`, compare client delta vs server delta
4. Log all conflict resolutions for audit trail

### test
1. Enable airplane mode mid-operation; verify app still functions
2. Make changes on two devices; sync both; verify conflict resolution outcome
3. Kill app during sync; verify pending queue is preserved and resumes correctly
4. Test migration: add column to schema, verify existing data survives

## Output

```
## Offline Architecture

### Schema
[Table definitions with sync metadata]

### Repository
[Write-local-first with sync trigger]

### Sync Worker
[Background task with retry and conflict handling]

### Network Monitor
[Connectivity observation triggering queue flush]
```

## Examples

```bash
# Android Room + WorkManager offline stack
/offline design --android

# iOS Core Data with BGTaskScheduler sync
/offline sync --ios

# Last-write-wins conflict resolution
/offline conflict --strategy lww --android

# Flutter Drift with workmanager
/offline design --flutter

# Immediate sync on reconnect
/offline sync --android --realtime
```
