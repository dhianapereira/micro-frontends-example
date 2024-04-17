import 'package:core/core.dart';

class BaseAppImpl extends BaseApp {
  @override
  Map<String, WidgetBuilderArgs> get baseRoutes => {};

  @override
  List<MicroApp> get microApps {
    return [];
  }
}
