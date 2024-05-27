import 'package:base_app/src/configs/constants.dart';
import 'package:core/core.dart';

class BaseAppTranslator {
  BaseAppTranslator._();

  static String translate({required String key, List<String> args = const []}) {
    final context = navigatorKey.currentContext;
    if (context == null) return key;

    return Translator.of(context).translate(
      key: key,
      packageName: Constants.packageName,
      args: args,
    );
  }
}
