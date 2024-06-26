import 'dart:async';

import 'package:core/event_bus/library.dart';

class EventBus {
  EventBus._internal();
  static final _singleton = EventBus._internal();
  factory EventBus() => _singleton;

  final _bus = StreamController.broadcast();

  static void emit(EventType event) {
    _singleton._bus.sink.add(event);
  }

  static StreamEventBus get listen => _singleton._bus.stream.listen;
}
