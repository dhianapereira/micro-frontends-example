import 'package:base_app/src/configs/constants.dart';
import 'package:core/core.dart';
import 'package:get_it/get_it.dart';

class BaseAppTranslator {
  BaseAppTranslator._();

  static String translate({required String key, List<String> args = const []}) {
    final context = navigatorKey.currentContext;
    if (context == null) return key;

    return GetIt.I<Translator>().translate(
      key: key,
      packageName: Constants.packageName,
      args: args,
    );
  }
}
