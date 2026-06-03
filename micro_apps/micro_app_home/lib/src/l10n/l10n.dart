import 'package:flutter/widgets.dart';
import 'package:micro_app_home/src/l10n/generated/micro_app_home_localizations.dart';

export 'generated/micro_app_home_localizations.dart';

extension MicroAppHomeL10nX on BuildContext {
  MicroAppHomeLocalizations get l10n => MicroAppHomeLocalizations.of(this);
}
