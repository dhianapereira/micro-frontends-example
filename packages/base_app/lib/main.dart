import 'package:base_app/base_app.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

void main() {
  final baseApp = BaseAppImpl();

  runApp(AppWidget(baseApp));
}

class AppWidget extends StatelessWidget {
  final BaseApp _baseApp;
  const AppWidget(this._baseApp, {super.key});

  @override
  Widget build(BuildContext context) {
    _baseApp.registerRouters();

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
