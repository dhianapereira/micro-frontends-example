import 'package:core/core.dart';
import 'package:micro_app_home/src/configs/constants.dart';

class MicroAppHomeTranslator {
  final Translator _translator;
  MicroAppHomeTranslator(this._translator);

  String translate({required String key, List<String> args = const []}) {
    return _translator.translate(
      key: key,
      packageName: Constants.microAppName,
      args: args,
    );
  }
}
