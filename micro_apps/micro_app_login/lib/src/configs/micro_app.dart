import 'package:foundations/foundations.dart';
import 'package:micro_app_login/src/configs/constants.dart';
import 'package:micro_app_login/src/login_page.dart';
import 'package:navigation/navigation.dart';

class MicroAppLogin implements MicroApp {
  @override
  String get microAppName => Constants.microAppName;

  @override
  List<AppRoute> get routes => [
    AppRoute.page(path: '/login', builder: (_) => const LoginPage()),
  ];

  @override
  Future<void> injectionsRegister() async {}

  @override
  void registerEventHandlers() {}
}
