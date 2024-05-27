import 'package:core/abstractions/src/i18n.dart';
import 'package:core/abstractions/src/utils.dart';

abstract class MicroApp {
  String get microAppName;
  Map<String, WidgetBuilderArgs> get routes;
  I18n get i18n;
  void Function() get injectionsRegister;
  void Function() get registerListener;
}
