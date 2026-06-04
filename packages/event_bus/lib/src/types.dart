import 'dart:async';

import 'package:event_bus/src/app_event.dart';

typedef StreamEventBus =
    StreamSubscription<AppEvent> Function(
      void Function(AppEvent event)? onData, {
      bool? cancelOnError,
      void Function()? onDone,
      Function? onError,
    });
