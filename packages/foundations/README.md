# Foundations

`foundations` contains the small contracts and primitives shared by the shell app and the micro apps.

It is intentionally lightweight: this package should define how modules connect to each other, not implement product behavior. The goal is to give each app a stable vocabulary for routes, micro app registration, and shared navigation primitives without coupling those modules to infrastructure packages such as event buses, dependency injection, networking, storage, or localization.

## What Belongs Here

- Public abstractions used across package boundaries, such as `MicroApp`.
- Shared type definitions that describe integration points, such as `WidgetBuilderArgs`.
- Tiny primitives needed by multiple modules to collaborate, such as the root `navigatorKey`.

## What Does Not Belong Here

- Feature logic.
- Dependency injection setup.
- Localization resources or generated l10n code.
- Dependencies that are only useful to one app or one package.

Keeping `foundations` narrow helps the monorepo stay modular: micro apps can depend on the contracts they need without inheriting unrelated infrastructure.
