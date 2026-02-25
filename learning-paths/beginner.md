# Beginner Learning Path - Mobile Development Fundamentals

## Overview

This path introduces mobile development using Flutter, Google's cross-platform framework. You will understand how mobile apps differ from web and desktop, build your first Flutter application, learn navigation patterns, and grasp the widget system that makes Flutter productive. By the end, you will have a working mobile app running on both Android and iOS from a single codebase.

## Prerequisites

- Programming experience in any language (JavaScript, Python, Java, or similar)
- Basic understanding of OOP concepts (classes, inheritance, interfaces)
- A development machine with at least 8GB RAM
- Android Studio or Xcode installed (or both for full cross-platform testing)

## Modules

### Module 1: Mobile Development Fundamentals

#### Concepts

- Mobile vs web/desktop: constrained resources, touch input, lifecycle management, permissions
- Native vs cross-platform: Swift/Kotlin for one platform, Flutter/React Native for both
- Why Flutter: compiled to native code (not a WebView), hot reload, single codebase, rich widget system
- Dart language essentials: typed language, async/await, null safety, collections, classes
- The widget tree: everything is a widget, widgets compose into larger widgets
- StatelessWidget vs StatefulWidget: when state changes, the widget rebuilds
- BuildContext: how widgets know where they are in the tree
- Hot reload vs hot restart: preserving state during development vs clean restart
- Material Design and Cupertino: platform-appropriate design languages
- App lifecycle: foreground, background, paused, detached and why each matters

#### Hands-On Exercise

Set up your development environment and build a first app:

1. Install Flutter SDK and verify: `flutter doctor` (resolve all issues before proceeding)
2. Create a new project: `flutter create my_first_app`
3. Explore the project structure: `lib/`, `android/`, `ios/`, `pubspec.yaml`
4. Replace the default counter app with a personal profile card:
   - A `Card` widget with your name, a placeholder avatar (`CircleAvatar`), and a short bio
   - Three `ListTile` widgets showing email, phone, and website
   - A `FloatingActionButton` that shows a `SnackBar` message
5. Run on an emulator and a physical device (if available)
6. Make a change and use hot reload to see it instantly
7. Examine the widget tree in Dart DevTools (Flutter Inspector)

Understand what happens: `main()` calls `runApp()`, which mounts the root widget, which builds its children recursively.

#### Key Takeaways

- Flutter's widget tree is the mental model: everything you see is built by composing widgets
- Hot reload is transformative for UI development: change code, see results in under a second
- Dart's null safety catches entire categories of bugs at compile time
- Start with Material Design; customize later when you understand the constraints

### Module 2: Layouts, Widgets, and Styling

#### Concepts

- Layout widgets: `Column`, `Row`, `Stack`, `Container`, `Padding`, `SizedBox`, `Expanded`, `Flexible`
- The layout algorithm: constraints go down, sizes go up, parent sets position
- `Expanded` vs `Flexible`: filling available space vs sizing based on flex factor
- Scrolling: `ListView`, `GridView`, `SingleChildScrollView`, `CustomScrollView` with `Slivers`
- Styling: `TextStyle`, `BoxDecoration`, `ThemeData` for consistent app-wide styling
- Responsive design: `MediaQuery`, `LayoutBuilder`, `OrientationBuilder` for adapting to screen size
- Custom widgets: extracting reusable components to keep build methods manageable
- Keys: when and why Flutter needs help identifying widgets (lists, reorderable items)
- Assets: images, fonts, and other static resources in `pubspec.yaml`
- Debugging layout: `debugPaintSizeEnabled`, overflow errors, and how to read them

#### Hands-On Exercise

Build a recipe list application:

1. Create a data model: `Recipe` class with name, description, image URL, ingredients list, and cook time
2. Build a scrollable list of recipe cards using `ListView.builder`:
   - Each card shows an image, recipe name, cook time, and short description
   - Use `Card` with `ClipRRect` for rounded image corners
3. Add a detail page that shows the full recipe when a card is tapped (for now, just push a new route)
4. Create a custom `RecipeCard` widget that encapsulates the card design
5. Apply a theme: define colors, typography, and card styles in `ThemeData`
6. Make the layout responsive:
   - Phone: single column list
   - Tablet: two-column grid using `LayoutBuilder` to detect available width
7. Add pull-to-refresh functionality using `RefreshIndicator`
8. Handle edge cases: empty list state, loading state, error state

Test on different screen sizes using the emulator's device selector.

#### Key Takeaways

- The layout algorithm is "constraints down, sizes up": understand this and layout makes sense
- Extract custom widgets early: a 200-line build method is unreadable and unmaintainable
- Theme your app from the start: retroactively adding consistent styling is painful
- Always handle empty, loading, and error states in every screen

### Module 3: Navigation and Routing

#### Concepts

- Navigation stack: push and pop pages like a stack of cards
- Navigator 1.0: `Navigator.push`, `Navigator.pop`, simple and imperative
- Navigator 2.0 (Router): declarative routing, deep linking, web URL support
- go_router: the recommended declarative routing package for Flutter
- Named routes vs path-based routes: path-based scale better and support deep linking
- Route parameters: passing data between screens via path parameters and query parameters
- Navigation patterns: tab bar, drawer, bottom navigation, nested navigation
- Deep linking: opening a specific screen from an external URL or push notification
- Route guards: redirecting based on authentication state or permissions
- Back button handling: Android hardware back, iOS swipe back, and custom back behavior

#### Hands-On Exercise

Add complete navigation to your recipe app:

1. Install and configure `go_router`:
   ```dart
   final router = GoRouter(
     routes: [
       GoRoute(path: '/', builder: (context, state) => const RecipeListPage()),
       GoRoute(path: '/recipe/:id', builder: (context, state) {
         final id = state.pathParameters['id']!;
         return RecipeDetailPage(recipeId: id);
       }),
       GoRoute(path: '/favorites', builder: (context, state) => const FavoritesPage()),
       GoRoute(path: '/settings', builder: (context, state) => const SettingsPage()),
     ],
   );
   ```
2. Add bottom navigation with three tabs: Recipes, Favorites, Settings
3. Implement nested navigation: each tab maintains its own navigation stack
4. Add a search page accessible from the app bar
5. Implement deep linking: the URL `/recipe/42` should open recipe 42 directly
6. Add a route guard: if no recipes are loaded, redirect to a loading/error page
7. Add page transitions: custom slide or fade animations between routes
8. Handle the Android back button correctly in nested navigation

Test deep linking by launching the app with a specific URL. Verify the back button works correctly at every navigation level.

#### Key Takeaways

- Declarative routing (go_router) is more maintainable than imperative navigation for any non-trivial app
- Deep linking is a requirement, not a feature: users expect URLs to work
- Nested navigation is complex; plan your navigation graph before coding
- Navigation is architecture: changing it later affects every screen in the app

## Assessment

You have completed the beginner path when you can:

1. Explain Flutter's widget tree, build process, and layout algorithm
2. Build a multi-screen app with responsive layouts that work on phones and tablets
3. Implement declarative routing with deep linking support
4. Create reusable custom widgets with proper theming
5. Run and debug your app on both Android and iOS emulators

## Next Steps

- Move to the **Intermediate Path**: state management, API integration, and platform-specific code
- Read the official Flutter documentation thoroughly (it is exceptionally well-written)
- Explore the Flutter widget catalog: there are hundreds of built-in widgets you have not seen yet
- Build a personal app you will actually use: real motivation produces real learning
