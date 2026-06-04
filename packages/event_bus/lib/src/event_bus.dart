import 'dart:async';

import 'package:event_bus/src/app_event.dart';
import 'package:event_bus/src/types.dart';

class EventBus {
  EventBus._internal();
  static final _singleton = EventBus._internal();
  factory EventBus() => _singleton;

  final _bus = StreamController<AppEvent>.broadcast();

  static void emit(AppEvent event) {
    _singleton._bus.sink.add(event);
  }

  static StreamEventBus get listen => _singleton._bus.stream.listen;
}
