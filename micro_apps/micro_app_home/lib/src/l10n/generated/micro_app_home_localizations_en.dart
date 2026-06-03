// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'micro_app_home_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class MicroAppHomeLocalizationsEn extends MicroAppHomeLocalizations {
  MicroAppHomeLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String greetings(String name) {
    return 'Hello, $name';
  }
}
