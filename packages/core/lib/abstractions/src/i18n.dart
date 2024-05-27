import 'dart:ui';

abstract class I18n{
  final String packageName;
  I18n(this.packageName);

  Map<Locale, Map<String, String>> get texts;
}
