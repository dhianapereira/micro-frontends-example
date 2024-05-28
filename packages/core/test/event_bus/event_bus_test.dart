import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:async';

void main() {
  test('Should verify that EventBus is really a singleton', () {
    final instance1 = EventBus();
    final instance2 = EventBus();
    expect(instance1, same(instance2));
  });

  test('Should adds an event to the stream when emit is called', () async {
    const event = EventType.authSuccess;
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
