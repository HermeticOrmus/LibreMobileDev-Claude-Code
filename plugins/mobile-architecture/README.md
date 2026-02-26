# Mobile Architecture

Clean Architecture, MVVM, MVI, iOS Coordinator pattern, Android Navigation Component, feature modules, feature flags.

## What's Included

### Agents
- **mobile-architect** - Expert in Clean Architecture layer separation, repository pattern, UseCase design, iOS Coordinator navigation, Android Navigation Component + SafeArgs, multi-module structure

### Commands
- `/mobile-arch` - Design architecture, scaffold layers, implement navigation, generate tests

### Skills
- **mobile-arch-patterns** - Domain/data/presentation layer code, iOS Coordinator with delegate, MVI reducer, Android NavGraph + SafeArgs, Repository implementation pattern

## Quick Start

```bash
# Design Clean Architecture for a new feature
/mobile-arch design --android --feature checkout

# iOS Coordinator for complex flow
/mobile-arch navigate --ios --feature onboarding

# Scaffold all layers
/mobile-arch layers --flutter --feature user-profile
```

## Layer Dependencies

```
Presentation (ViewModel, UI)
    depends on ↓
Domain (UseCase, Repository interface, Entity)
    depends on ↓
Data (Repository impl, Remote, Local)
```

- Domain layer has zero platform imports
- Data layer has no presentation imports
- Presentation has no direct data source imports

## Pattern Selection

| Pattern | When to Use |
|---------|-------------|
| MVVM | Standard features, CRUD, most apps |
| MVI | Complex state machines, fintech, audit trails |
| Coordinator (iOS) | Complex multi-step flows, reusable flows |
| Single-module | Early stage, small team |
| Multi-module | Build time > 3min, multiple teams |
