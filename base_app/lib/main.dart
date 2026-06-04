import 'package:base_app/src/app_widget.dart';
import 'package:base_app/src/base_app.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final baseApp = BaseApp();
  runApp(AppWidget(baseApp));
}
