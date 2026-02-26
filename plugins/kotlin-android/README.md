# Kotlin Android

Kotlin coroutines, Jetpack Compose, ViewModel + StateFlow, Room, Hilt, WorkManager.

## What's Included

### Agents
- **android-developer** - Expert in Kotlin Flow operators, Compose recomposition optimization, ViewModel SavedStateHandle, Room DAO with Flow, Hilt scoping, WorkManager constraints

### Commands
- `/android` - Compose screens, ViewModels, Room entities, Hilt modules

### Skills
- **kotlin-android-patterns** - MVVM with StateFlow, Room Entity+DAO+Repository, Hilt module, Compose recomposition optimization with derivedStateOf, WorkManager CoroutineWorker

## Quick Start

```bash
# Full feature screen (Compose + ViewModel + Room)
/android compose --feature product-list

# ViewModel with async state management
/android viewmodel --feature checkout

# Database setup with migrations
/android room --feature order-history
```

## Architecture Stack

```
UI Layer:        Compose + collectAsStateWithLifecycle()
                 ↑
ViewModel:       StateFlow<UiState> + viewModelScope
                 ↑
Domain:          UseCase classes (pure Kotlin)
                 ↑
Repository:      Room DAO + Retrofit API (Dispatchers.IO)
                 ↑
Data Sources:    Room Database + Remote API
```

## Key Rules

- Always use `collectAsStateWithLifecycle()` not `collectAsState()` — stops on background
- All database operations on `Dispatchers.IO` — never main thread
- `SavedStateHandle` for any state that must survive process death
- `derivedStateOf { }` for computed values to avoid unnecessary recompositions
- Single `UiState` data class per screen — no multiple LiveData fields
