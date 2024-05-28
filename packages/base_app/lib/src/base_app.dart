import 'package:base_app/src/configs/i18n.dart';
import 'package:core/core.dart';
import 'package:micro_app_home/micro_app_home.dart';
import 'package:micro_app_login/micro_app_login.dart';

class BaseAppImpl extends BaseApp {
  @override
  Map<String, WidgetBuilderArgs> get baseRoutes => {};

  @override
  List<MicroApp> get microApps {
    return [
      MicroAppLogin(),
      MicroAppHome(),
    ];
  }

  @override
  final I18n i18n = BaseAppI18n();
}
