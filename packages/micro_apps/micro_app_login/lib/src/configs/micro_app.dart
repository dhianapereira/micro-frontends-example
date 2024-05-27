import 'package:core/core.dart';
import 'package:micro_app_login/src/configs/constants.dart';
import 'package:micro_app_login/src/configs/i18n.dart';
import 'package:micro_app_login/src/login_page.dart';

class MicroAppLogin implements MicroApp {
  @override
  String get microAppName => Constants.microAppName;

  @override
  Map<String, WidgetBuilderArgs> get routes {
    return {
      '/login': (_, __) => const LoginPage(),
    };
  }

  @override
  void Function() get injectionsRegister => () {};

  @override
  void Function() get registerListener => () {};

  @override
  final I18n i18n = MicroAppLoginI18n();
}
