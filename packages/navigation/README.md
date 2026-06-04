# Navigation

`navigation` contains the router setup used by the shell app.

Micro apps expose their routes through the `MicroApp` contract. The shell app owns the `/` root route and composes micro app routes through `AppRouter`.

GoRouter is an implementation detail inside this package. Other packages use the workspace contracts instead of importing GoRouter directly.

Micro apps can navigate inside their own route namespace with `context.appNavigator`:

```dart
context.appNavigator.go('/login/forgot-password');
```

Use the event bus for app-level events and shell-owned navigation between micro apps. Use `navigation` directly for local page transitions inside a micro app.
