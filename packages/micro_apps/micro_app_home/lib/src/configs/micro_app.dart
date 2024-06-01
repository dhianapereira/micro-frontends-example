import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:micro_app_home/src/configs/constants.dart';
import 'package:micro_app_home/src/configs/i18n.dart';
import 'package:micro_app_home/src/configs/translator.dart';
import 'package:micro_app_home/src/home_page.dart';

class MicroAppHome implements MicroApp {
  @override
  String get microAppName => Constants.microAppName;

  @override
  Map<String, WidgetBuilderArgs> get routes {
    return {
      '/home': (_, __) => HomePage(),
    };
  }

  @override
  Future<void> injectionsRegister() async {
    GetIt.I.registerSingleton<MicroAppHomeTranslator>(
      MicroAppHomeTranslator(GetIt.I<Translator>()),
    );
  }

  @override
  void Function() get registerListener => () {};

  @override
  final I18n i18n = MicroAppHomeI18n();
}
