import 'package:base_app/base_app.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

void main() {
  final baseApp = BaseAppImpl();

  runApp(AppWidget(baseApp));
}

class AppWidget extends StatelessWidget {
  final BaseApp _baseApp;
  AppWidget(this._baseApp, {super.key}) {
    _baseApp.registerRoutes();
    _baseApp.registerInjections();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Micro Frontends',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: navigatorKey,
      onGenerateRoute: _baseApp.generateRoute,
      initialRoute: '/login',
    );
  }
}
