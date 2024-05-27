import 'package:base_app/src/base_app.dart';
import 'package:base_app/src/configs/translator.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

void main() {
  final baseApp = BaseAppImpl();

  runApp(AppWidget(baseApp));
}

class AppWidget extends StatelessWidget {
  final BaseApp _baseApp;

  AppWidget(this._baseApp, {super.key}) {
    _baseApp.registerI18n();
    _baseApp.registerRoutes();
    _baseApp.registerInjections();
    _baseApp.registerListeners();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: BaseAppTranslator.translate(key: 'app_name'),
      theme: ThemeData(primarySwatch: Colors.blue),
      navigatorKey: navigatorKey,
      onGenerateRoute: _baseApp.generateRoute,
      initialRoute: '/login',
      localizationsDelegates: const [
        TranslatorDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: TranslatorDelegate.supportedLocales,
    );
  }
}
