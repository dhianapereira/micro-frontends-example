import 'dart:async';

typedef StreamEventBus = StreamSubscription Function(
  void Function(dynamic event)? onData, {
  bool? cancelOnError,
  void Function()? onDone,
  Function? onError,
});
