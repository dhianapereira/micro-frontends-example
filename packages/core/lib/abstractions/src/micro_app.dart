import 'package:core/abstractions/src/utils.dart';

abstract class MicroApp {
  String get microAppName;
  Map<String, WidgetBuilderArgs> get routes;
  void Function() get injectionsRegister;
}
