import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

///This class is responsible for internationalization.
///It has the translate method, here is an example of how to use it
///```dart
///final hello = Translator.of(context).translate(
///     key: 'hello',
///     args: ['World!'],
///);
///print(hello); //Hello World!
///```
class Translator {
  final Locale locale;
  static final Map<String, Map<Locale, Map<String, String>>> _resources = {};

  Translator(this.locale);

  static Translator of(BuildContext context) {
    final instance = Translator.maybeOf(context);
    assert(instance != null,
        'No instance of Translator present in the widget tree.');
    return instance!;
  }

  static Translator? maybeOf(BuildContext context) {
    return Localizations.of<Translator>(context, Translator);
  }

  static void addTexts(
    String packageName,
    Map<Locale, Map<String, String>> texts,
  ) {
    texts.forEach((locale, value) {
      if (!_resources.containsKey(packageName)) {
        _resources[packageName] = {};
      }
      if (!_resources[packageName]!.containsKey(locale)) {
        _resources[packageName]![locale] = {};
      }
      _resources[packageName]![locale]!.addAll(value);
    });
  }

  ///This is the method for retrieving some text.
  ///For this you need to add the [key] and [packageName].
  ///If you want to add one or more arguments
  ///just add the strings in [args]
  String translate({
    required String key,
    required String packageName,
    List<String> args = const [],
  }) {
    String? value = _resources[packageName]?[locale]?[key];
    if (value == null) return key;

    if (args.isNotEmpty) {
      for (var i = 0; i < args.length; i++) {
        value = value!.replaceFirst('%s', args[i]);
      }
    }

    return value ?? key;
  }
}

class TranslatorDelegate extends LocalizationsDelegate<Translator> {
  const TranslatorDelegate();

  ///When adding a new language do not forget
  ///to add the new Locale in [supportedLocales]
  static List<Locale> get supportedLocales {
    return const <Locale>[
      Locale('pt', 'BR'),
      Locale('en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }

  @override
  Future<Translator> load(Locale locale) {
    return SynchronousFuture<Translator>(Translator(locale));
  }

  @override
  bool shouldReload(TranslatorDelegate old) => false;
}
