# Foundations

`foundations` contains the small contracts shared by the shell app and the micro apps.

It is intentionally lightweight: this package should define how modules participate in the app lifecycle and expose route metadata, not implement product behavior. The goal is to give each app a stable vocabulary for micro app registration without coupling those modules to app-specific packages.

## What Belongs Here

- Public abstractions used across package boundaries, such as `MicroApp`.
- Lifecycle contracts used by the shell to initialize micro apps.
- Stable interfaces that should not depend on router implementations, event bus, localization, or feature packages.

## What Does Not Belong Here

- Feature logic.
- Router setup.
- Navigation keys or router instances.
- Event bus implementations.
- Dependency injection setup.
- Localization resources or generated l10n code.
- Dependencies that are only useful to one app or one package.

Keeping `foundations` narrow helps the monorepo stay modular: micro apps can depend on the contracts they need without inheriting unrelated infrastructure.
