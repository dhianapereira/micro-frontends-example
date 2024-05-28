import 'package:core/core.dart';
import 'package:micro_app_home/src/configs/constants.dart';

class MicroAppHomeTranslator {
  MicroAppHomeTranslator._();

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
