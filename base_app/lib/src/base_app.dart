import 'package:event_bus/event_bus.dart';
import 'package:flutter/widgets.dart';
import 'package:foundations/foundations.dart';
import 'package:micro_app_home/micro_app_home.dart';
import 'package:micro_app_login/micro_app_login.dart';
import 'package:navigation/navigation.dart';

class BaseApp {
  final List<MicroApp> _microApps = [MicroAppLogin(), MicroAppHome()];

  late final AppRouter _appRouter = AppRouter(routes: _microAppRoutes);

  RouterConfig<Object> get routerConfig => _appRouter.config;

  List<AppRoute> get _microAppRoutes {
    return _microApps.expand((microApp) => microApp.routes).toList();
  }

  Future<void> init() async {
    await _registerInjections();
    _registerShellListeners();
    _registerMicroAppEventHandlers();
  }

  Future<void> _registerInjections() async {
    for (final microApp in _microApps) {
      await microApp.injectionsRegister();
    }
  }

  void _registerShellListeners() {
    EventBus.listen((event) {
      if (event == EventType.authSuccess) {
        _appRouter.go('/home');
      }
    });
  }

  void _registerMicroAppEventHandlers() {
    for (final microApp in _microApps) {
      microApp.registerEventHandlers();
    }
  }
}
