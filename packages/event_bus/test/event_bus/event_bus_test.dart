import 'package:event_bus/event_bus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:async';

class _FakeEvent extends Fake implements AppEvent {}

void main() {
  test('Should verify that EventBus is really a singleton', () {
    final instance1 = EventBus();
    final instance2 = EventBus();
    expect(instance1, same(instance2));
  });

  test('Should adds an event to the stream when emit is called', () async {
    final event = _FakeEvent();
    final completer = Completer<void>();
    final subscription = EventBus.listen((receivedEvent) {
      expect(receivedEvent, event);
      completer.complete();
    });
    EventBus.emit(event);
    await completer.future;
    await subscription.cancel();
  });
}
