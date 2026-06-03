import 'package:commons/commons.dart';
import 'package:core/core.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:micro_app_login/src/configs/translator.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final translator = GetIt.I<MicroAppLoginTranslator>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.blue),
          child: TextWidget(
            translate: () => translator.translate(key: 'login'),
            color: Colors.white,
          ),
          onPressed: () {
            EventBus.emit(EventType.authSuccess);
            navigatorKey.currentState?.pushReplacementNamed('/home');
          },
        ),
      ),
    );
  }
}
