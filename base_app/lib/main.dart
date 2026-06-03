import 'package:base_app/src/base_app.dart';
import 'package:foundations/foundations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:micro_app_home/micro_app_home.dart';
import 'package:micro_app_login/micro_app_login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final baseApp = BaseApp();
  await baseApp.init();
  runApp(AppWidget(baseApp));
}

class AppWidget extends StatefulWidget {
  final BaseApp _baseApp;

  const AppWidget(this._baseApp, {super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Micro Frontends',
      theme: ThemeData(primarySwatch: Colors.blue),
      navigatorKey: navigatorKey,
      onGenerateRoute: widget._baseApp.generateRoute,
      initialRoute: '/login',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        MicroAppHomeLocalizations.delegate,
        MicroAppLoginLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('pt'),
      ],
    );
  }
}
