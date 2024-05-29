import 'package:core/core.dart';
import 'package:micro_app_home/src/configs/constants.dart';
import 'package:micro_app_home/src/configs/i18n.dart';
import 'package:micro_app_home/src/home_page.dart';

class MicroAppHome implements MicroApp {
  @override
  String get microAppName => Constants.microAppName;

  @override
  Map<String, WidgetBuilderArgs> get routes {
    return {
      '/home': (_, __) => const HomePage(),
    };
  }

  @override
  Future<void> injectionsRegister() async {}

  @override
  void Function() get registerListener => () {};

  @override
  final I18n i18n = MicroAppHomeI18n();
}
