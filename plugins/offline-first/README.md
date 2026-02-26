# Offline First

Core Data, Room, Drift, background sync with BGTaskScheduler/WorkManager, conflict resolution strategies.

## What's Included

### Agents
- **offline-architect** - Expert in local database design, sync queue patterns, LWW/CRDT conflict resolution, Core Data, Room, Drift, and network state management

### Commands
- `/offline` - Design offline layers: `design`, `sync`, `conflict`, `test`

### Skills
- **offline-first-patterns** - Room Entity with syncStatus, CoroutineWorker SyncWorker with retry, Core Data background context pattern, Drift table with sync metadata, Repository write-local-first, conflict resolution matrix, Flutter connectivity_plus sync trigger

## Quick Start

```bash
# Android offline stack
/offline design --android

# iOS Core Data with background sync
/offline sync --ios

# Last-write-wins conflict resolution
/offline conflict --strategy lww

# Flutter Drift offline data layer
/offline design --flutter
```

## Sync Metadata Schema

Every synced table needs these columns:

| Column | Type | Purpose |
|--------|------|---------|
| `id` | UUID (String) | Client-generated stable ID |
| `updatedAt` | Int (epoch ms) | Used for LWW conflict resolution |
| `syncStatus` | Enum | pending / synced / failed |
| `deletedAt` | Int? (epoch ms) | Soft delete — never hard-delete synced rows |

## Background Sync by Platform

| Platform | API | Constraints |
|----------|-----|-------------|
| iOS | `BGProcessingTask` | requiresNetworkConnectivity, requiresExternalPower |
| iOS | `BGAppRefreshTask` | < 30 second budget |
| Android | WorkManager `PeriodicWorkRequest` | NetworkType.CONNECTED |
| Flutter | workmanager package | wraps platform APIs |

## Critical Rules

- Never use auto-increment integers as IDs for synced data — use UUIDs generated client-side
- Always soft-delete synced records — `deletedAt` timestamp, not SQL DELETE
- Write to local DB first, always — network availability must never block user action
- Buffer all writes in the pending queue; flush FIFO on reconnect
- Core Data: always write on background context, never on `viewContext`
