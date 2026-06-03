// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'micro_app_home_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class MicroAppHomeLocalizationsPt extends MicroAppHomeLocalizations {
  MicroAppHomeLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String greetings(String name) {
    return 'Olá, $name';
  }
}
