import 'dart:ui';

import 'package:core/abstractions/src/i18n.dart';
import 'package:flutter/cupertino.dart';
import 'package:micro_app_login/src/configs/constants.dart';

class MicroAppLoginI18n extends I18n {
  MicroAppLoginI18n() : super(Constants.microAppName);

  @override
  final Map<Locale, Map<String, String>> texts = {
    const Locale('pt', 'BR'): {'login': 'Entrar'},
    const Locale('en'): {'login': 'Login'},
  };
}
