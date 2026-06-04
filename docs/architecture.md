# Architecture

This repository is organized as a Flutter monorepo with a shell app, independently owned micro apps, and small shared packages.

The goal is to keep each module responsible for its own code and dependencies while still giving the app a shared integration model.

## Structure

```text
base_app/
micro_apps/
  micro_app_home/
  micro_app_login/
packages/
  event_bus/
  foundations/
  navigation/
docs/
```

## Shell App

`base_app` is the host application.

It is responsible for:

- registering micro apps;
- owning the root `/` splash route;
- composing routes exposed by micro apps into one router;
- configuring the root `MaterialApp.router`;
- registering localization delegates exported by micro apps;
- owning the Android and iOS Flutter app targets.

The shell should not own feature UI that belongs to a micro app.

## Micro Apps

`micro_apps` contains feature modules.

Each micro app owns:

- its screens and widgets;
- its route map;
- its localized strings and generated l10n files;
- its tests;
- its direct package dependencies.

Micro apps expose a `MicroApp` implementation with lifecycle hooks and route ownership.

## Shared Packages

`packages/foundations` contains shared contracts used across package boundaries. The main example is `MicroApp`.

`packages/navigation` contains route contracts and the internal GoRouter setup. `AppRoute` lives here, while GoRouter stays hidden behind `AppRouter` and `AppNavigator`. Packages that only need the route contract can import `package:navigation/app_route.dart`. The shell owns `/`; micro apps should register feature paths such as `/login` or `/home`, and internal pages should remain under that namespace, such as `/login/forgot-password`.

`packages/event_bus` contains app-level event infrastructure. It allows micro apps to emit coarse-grained events without depending directly on the shell app. Concrete events live in the package that owns the behavior, while `event_bus` only owns the bus and `AppEvent` contract.

Shared packages should stay focused. A package should not become a place to centralize unrelated dependencies just to avoid repeating declarations in `pubspec.yaml`.

## Dependency Direction

The dependency graph should stay simple:

```text
base_app
  -> micro_apps/*
  -> packages/foundations
  -> packages/navigation
  -> packages/event_bus

micro_apps/*
  -> packages/foundations
  -> packages/navigation
  -> packages/event_bus, only when app-level events are needed

packages/foundations
  -> packages/navigation
  -> no app-specific packages

packages/navigation
  -> no app-specific packages

packages/event_bus
  -> no app-specific packages
```

Avoid dependencies from shared packages back into `base_app` or into specific micro apps.

## Localizations

Localized strings are owned by the package that displays them.

Micro apps keep ARB files under:

```text
lib/src/l10n/arb/
```

Generated localization files are written to:

```text
lib/src/l10n/generated/
```

Each micro app exposes a `context.l10n` extension through its public library. The shell aggregates the localization delegates exported by each micro app.

## Testing

Tests live next to the package they validate. Micro apps test their routes, constants, and screens. Shared packages test their own behavior independently.

The root Melos scripts run tests and analysis across the workspace.
