import 'package:core/abstractions/src/utils.dart';

abstract class MicroApp {
  String get microAppName;
  Map<String, WidgetBuilderArgs> get routes;
  Future<void> injectionsRegister();
  void Function() get registerListener;
}
