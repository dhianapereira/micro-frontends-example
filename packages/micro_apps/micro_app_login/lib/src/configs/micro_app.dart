import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:micro_app_login/src/configs/constants.dart';
import 'package:micro_app_login/src/configs/i18n.dart';
import 'package:micro_app_login/src/configs/translator.dart';
import 'package:micro_app_login/src/login_page.dart';

class MicroAppLogin implements MicroApp {
  @override
  String get microAppName => Constants.microAppName;

  @override
  Map<String, WidgetBuilderArgs> get routes {
    return {
      '/login': (_, __) => LoginPage(),
    };
  }

  @override
  Future<void> injectionsRegister() async {
    GetIt.I.registerSingleton<MicroAppLoginTranslator>(
      MicroAppLoginTranslator(GetIt.I<Translator>()),
    );
  }

  @override
  void Function() get registerListener => () {};

  @override
  final I18n i18n = MicroAppLoginI18n();
}
