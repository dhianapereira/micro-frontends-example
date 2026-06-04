import 'dart:async';

import 'package:event_bus/src/event_type.dart';

typedef StreamEventBus =
    StreamSubscription<EventType> Function(
      void Function(EventType event)? onData, {
      bool? cancelOnError,
      void Function()? onDone,
      Function? onError,
    });
