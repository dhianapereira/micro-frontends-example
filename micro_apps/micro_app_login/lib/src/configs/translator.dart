import 'package:core/core.dart';
import 'package:micro_app_login/src/configs/constants.dart';

class MicroAppLoginTranslator {
  final Translator _translator;
  MicroAppLoginTranslator(this._translator);

  String translate({required String key, List<String> args = const []}) {
    return _translator.translate(
      key: key,
      packageName: Constants.microAppName,
      args: args,
    );
  }
}
