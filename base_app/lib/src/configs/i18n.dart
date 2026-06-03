import 'dart:ui';

import 'package:base_app/src/configs/constants.dart';
import 'package:core/core.dart';

class BaseAppI18n extends I18n {
  BaseAppI18n() : super(Constants.packageName);

  @override
  final Map<Locale, Map<String, String>> texts = {};
}
