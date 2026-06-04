import 'package:foundations/foundations.dart';
import 'package:micro_app_login/src/configs/constants.dart';
import 'package:micro_app_login/src/forgot_password_page.dart';
import 'package:micro_app_login/src/login_page.dart';
import 'package:navigation/navigation.dart';

class MicroAppLogin implements MicroApp {
  @override
  String get microAppName => Constants.microAppName;

  @override
  List<AppRoute> get routes => [
    AppRoute.page(path: '/login', builder: (_) => const LoginPage()),
    AppRoute.page(
      path: '/login/forgot-password',
      builder: (_) => const ForgotPasswordPage(),
    ),
  ];

  @override
  Future<void> injectionsRegister() async {}

  @override
  void registerEventHandlers() {}
}
