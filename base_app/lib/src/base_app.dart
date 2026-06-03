import 'package:foundations/foundations.dart';
import 'package:flutter/material.dart';
import 'package:micro_app_home/micro_app_home.dart';
import 'package:micro_app_login/micro_app_login.dart';

class BaseApp {
  Map<String, WidgetBuilderArgs> get baseRoutes => {};

  List<MicroApp> get microApps {
    return [
      MicroAppLogin(),
      MicroAppHome(),
    ];
  }

  final Map<String, WidgetBuilderArgs> routes = {};

  Future<void> init() async {
    await _registerInjections();
    _registerRoutes();
    _registerListeners();
  }

  void _registerRoutes() {
    if (baseRoutes.isNotEmpty) routes.addAll(baseRoutes);
    if (microApps.isNotEmpty) {
      for (MicroApp microApp in microApps) {
        routes.addAll(microApp.routes);
      }
    }
  }

  Future<void> _registerInjections() async {
    if (microApps.isNotEmpty) {
      for (MicroApp microApp in microApps) {
        await microApp.injectionsRegister();
      }
    }
  }

  void _registerListeners() {
    if (microApps.isNotEmpty) {
      for (MicroApp microApp in microApps) {
        microApp.registerListener();
      }
    }
  }

  Route<dynamic>? generateRoute(RouteSettings settings) {
    var routerName = settings.name;
    var routerArgs = settings.arguments;

    var navigateTo = routes[routerName];
    if (navigateTo == null) return null;

    return MaterialPageRoute(
      builder: (context) => navigateTo.call(context, routerArgs),
    );
  }
}
