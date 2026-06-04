# Event Bus

`event_bus` contains the small event channel used by micro apps to emit app-level events without depending directly on the shell app.

The package is intentionally focused on event delivery only. It defines the `AppEvent` base contract and the bus API, but concrete events should live in the package that owns the behavior. It should not contain a central enum of every app event, micro app contracts, routing abstractions, dependency injection setup, or feature logic.

## Usage

Micro apps can define and emit their own events:

```dart
class AuthSuccessEvent extends AppEvent {
  const AuthSuccessEvent();
}

EventBus.emit(const AuthSuccessEvent());
```

The shell or another integration layer can listen for events:

```dart
final subscription = EventBus.listen((event) {
  if (event is AuthSuccessEvent) {
    // React to auth success.
  }
});
```

Keep events coarse-grained and app-level. Feature-specific state should stay inside the feature or micro app that owns it.
