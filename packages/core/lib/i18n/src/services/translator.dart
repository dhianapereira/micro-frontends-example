import 'package:flutter/material.dart';

abstract class Translator {
  @protected
  static final Map<String, Map<Locale, Map<String, String>>> resources = {};

  ///This is the method to register all the texts from the packages.
  ///To do this, simply pass the [packageName] and [texts] as parameters.
  static void addTexts(
    String packageName,
    Map<Locale, Map<String, String>> texts,
  ) {
    texts.forEach((locale, value) {
      if (!resources.containsKey(packageName)) {
        resources[packageName] = {};
      }
      if (!resources[packageName]!.containsKey(locale)) {
        resources[packageName]![locale] = {};
      }
      resources[packageName]![locale]!.addAll(value);
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
  });
}
