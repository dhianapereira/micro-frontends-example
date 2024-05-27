import 'package:core/core.dart';
import 'package:micro_app_login/src/configs/constants.dart';

class MicroAppLoginTranslator {
  MicroAppLoginTranslator._();

  static String translate({required String key, List<String> args = const []}) {
    final context = navigatorKey.currentContext;
    if (context == null) return key;

    return Translator.of(context).translate(
      key: key,
      packageName: Constants.microAppName,
      args: args,
    );
  }
}
