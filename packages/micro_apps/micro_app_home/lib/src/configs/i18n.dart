import 'dart:ui';

import 'package:core/abstractions/src/i18n.dart';
import 'package:flutter/cupertino.dart';
import 'package:micro_app_home/src/configs/constants.dart';

class MicroAppHomeI18n extends I18n {
  MicroAppHomeI18n() : super(Constants.microAppName);

  @override
  final Map<Locale, Map<String, String>> texts = {
    const Locale('pt', 'BR'): {'greetings': 'Olá, %s'},
    const Locale('en'): {'greetings': 'Hello, %s'},
  };
}
