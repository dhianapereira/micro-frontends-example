import 'dart:ui';

import 'package:flutter/foundation.dart';

abstract class LocaleService {
  ValueListenable<Locale> get listenable;
  void update(Locale newLocale);
  Locale get currentLocale;

  ///When adding a new language do not forget
  ///to add the new Locale in [supportedLocales]
  static List<Locale> get supportedLocales {
    return const <Locale>[
      Locale('pt', 'BR'),
      Locale('en', 'US'),
    ];
  }

  static bool isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
