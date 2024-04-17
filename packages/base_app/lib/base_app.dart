import 'package:core/core.dart';
import 'package:micro_app_login/micro_app_login.dart';

class BaseAppImpl extends BaseApp {
  @override
  Map<String, WidgetBuilderArgs> get baseRoutes => {};

  @override
  List<MicroApp> get microApps {
    return [MicroAppLogin()];
  }
}
