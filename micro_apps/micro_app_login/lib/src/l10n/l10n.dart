import 'package:flutter/widgets.dart';
import 'package:micro_app_login/src/l10n/generated/micro_app_login_localizations.dart';

export 'generated/micro_app_login_localizations.dart';

extension MicroAppLoginL10nX on BuildContext {
  MicroAppLoginLocalizations get l10n => MicroAppLoginLocalizations.of(this);
}
