# /mobile-arch

Design Clean Architecture layers, implement MVVM/MVI patterns, structure navigation, plan module structure.

## Trigger

`/mobile-arch [action] [options]`

## Actions

- `design` - Design full architecture for a feature or app
- `layers` - Generate Clean Architecture layer scaffolding
- `navigate` - Implement Coordinator (iOS) or NavGraph (Android) for a flow
- `test` - Generate architecture test strategy and sample tests

## Options

- `--ios` - Swift/UIKit/SwiftUI Coordinator pattern
- `--android` - Kotlin/Compose/Navigation Component
- `--flutter` - go_router / Riverpod architecture
- `--pattern <name>` - mvvm, mvi, clean
- `--feature <name>` - Feature being designed
- `--multi-module` - Include multi-module structure

## Process

### design
1. Identify domain entities for the feature
2. Define repository interface in domain layer
3. Define UseCase(s) for business logic operations
4. Define ViewModel UiState and events/intents
5. Show dependency injection wiring
6. Output full directory structure

### layers
Scaffold all three layers:
```
domain/
  entities/    Product.kt
  repositories/ProductRepository.kt (interface)
  usecases/    GetProductsUseCase.kt

data/
  remote/      ProductRemoteDataSource.kt, ProductApi.kt
  local/       ProductEntity.kt, ProductDao.kt
  repository/  ProductRepositoryImpl.kt

presentation/
  ProductListViewModel.kt
  ProductListUiState.kt
  ProductListScreen.kt (or Fragment)
```

### navigate
- iOS: `Coordinator` protocol + `AppCoordinator` + feature coordinator + delegate protocol
- Android: `NavGraph` XML/DSL + `SafeArgs` navigation action + args receiving
- Flutter: `go_router` routes with typed parameters

### test
Output:
- UseCase unit test (mock repository, verify state transitions)
- ViewModel unit test (mock UseCase, verify StateFlow values)
- Repository integration test (in-memory Room database)
- UI instrumentation test outline

## Examples

```bash
# Full Clean Architecture design for checkout feature
/mobile-arch design --android --feature checkout --pattern clean

# Scaffold MVI layers for iOS
/mobile-arch layers --ios --pattern mvi --feature auth

# iOS Coordinator for onboarding flow
/mobile-arch navigate --ios --feature onboarding

# Android navigation with SafeArgs
/mobile-arch navigate --android --feature product

# Test strategy for ViewModel layer
/mobile-arch test --android --feature checkout
```
