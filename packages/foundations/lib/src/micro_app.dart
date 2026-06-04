import 'package:navigation/navigation.dart';

abstract class MicroApp {
  String get microAppName;
  List<AppRoute> get routes;
  Future<void> injectionsRegister();
  void registerEventHandlers();
}
