import 'package:core/core.dart';

class TranslatorImpl implements Translator {
  final LocaleService _service;
  TranslatorImpl(this._service);

  @override
  String translate({
    required String key,
    required String packageName,
    List<String> args = const [],
  }) {
    final locale = _service.currentLocale;
    final texts = Translator.resources;
    String? value = texts[packageName]?[locale]?[key];
    if (value == null) return key;

    if (args.isNotEmpty) {
      for (var i = 0; i < args.length; i++) {
        value = value!.replaceFirst('%s', args[i]);
      }
    }

    return value ?? key;
  }
}
