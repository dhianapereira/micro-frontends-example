# Event Bus

`event_bus` contains the small event channel used by micro apps to publish app-level events without depending directly on the shell app.

The package is intentionally focused on event delivery only. It should not contain micro app contracts, routing abstractions, dependency injection setup, or feature logic. Those responsibilities belong to more specific packages, such as `foundations`, the shell app, or the micro apps themselves.

## Current Events

- `EventType.authSuccess`: emitted by the login micro app when authentication succeeds.

## Usage

Micro apps can emit events:

```dart
EventBus.emit(EventType.authSuccess);
```

The shell or another integration layer can listen for events:

```dart
final subscription = EventBus.listen((event) {
  // React to app-level events.
});
```

Keep events coarse-grained and app-level. Feature-specific state should stay inside the feature or micro app that owns it.
