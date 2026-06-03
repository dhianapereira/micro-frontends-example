import 'package:base_app/src/configs/i18n.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:micro_app_home/micro_app_home.dart';
import 'package:micro_app_login/micro_app_login.dart';

class BaseApp {
  Map<String, WidgetBuilderArgs> get baseRoutes => {};

  List<Package> get packages {
    return [
      I18nPackage(),
    ];
  }

  List<MicroApp> get microApps {
    return [
      MicroAppLogin(),
      MicroAppHome(),
    ];
  }

  final I18n i18n = BaseAppI18n();

  final Map<String, WidgetBuilderArgs> routes = {};

  Future<void> init() async {
    await _registerInjections();
    _registerI18n();
    _registerRoutes();
    _registerListeners();
  }

  void _registerI18n() {
    Translator.addTexts(i18n.packageName, i18n.texts);

    if (microApps.isNotEmpty) {
      for (MicroApp microApp in microApps) {
        Translator.addTexts(microApp.i18n.packageName, microApp.i18n.texts);
      }
    }
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
    if (packages.isNotEmpty) {
      for (Package package in packages) {
        await package.injectionsRegister();
      }
    }

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
