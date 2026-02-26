# /android

Jetpack Compose UI, ViewModel + StateFlow, Room database, Hilt DI, WorkManager.

## Trigger

`/android [action] [options]`

## Actions

- `compose` - Scaffold a Compose screen with ViewModel and state
- `viewmodel` - Implement ViewModel with UiState and event handling
- `room` - Generate Room entity, DAO, and database setup
- `hilt` - Set up Hilt module for a dependency

## Options

- `--feature <name>` - Feature name for scoping generated code
- `--mvi` - Use MVI pattern (intent → state) instead of MVVM
- `--flow` - Include Flow operators and StateFlow patterns
- `--workmanager` - Include WorkManager background task

## Process

### compose
1. Scaffold feature-level Composable with ViewModel via `hiltViewModel()`
2. Collect state with `collectAsStateWithLifecycle()`
3. Handle loading/error/content states
4. Pass events up as lambda callbacks (not ViewModel directly to child composables)

### viewmodel
Output:
- `UiState` data class with all fields
- `MutableStateFlow` + `StateFlow` exposure
- Event handling functions
- `viewModelScope.launch` with `Dispatchers.IO` for async work
- Error handling with `.catch` on Flow

### room
Output:
- `@Entity` data class with proper annotations
- `@Dao` interface with Flow-returning `@Query` methods
- `@Database` class with migration stubs
- Repository wrapping DAO
- `inMemoryDatabaseBuilder` test setup

### hilt
Output:
- `@Module` with `@InstallIn` for correct scope
- `@Provides` for concrete types
- `@Binds` for interface implementations
- `@HiltViewModel` ViewModel example

## Output

All output follows:
- Single-activity architecture with Navigation Component
- Unidirectional data flow (UDF)
- `collectAsStateWithLifecycle` (not `collectAsState`) for lifecycle-aware collection
- `Dispatchers.IO` for all database/network; `Dispatchers.Main` for UI

## Examples

```bash
# Full Compose screen for product list
/android compose --feature product-list

# ViewModel with SavedStateHandle for search
/android viewmodel --feature search

# Room setup for user entity
/android room --feature user-profile

# Hilt network module
/android hilt --feature network

# Background sync with WorkManager
/android compose --feature settings --workmanager
```
