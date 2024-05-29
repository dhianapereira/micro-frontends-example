import 'package:commons/commons.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:micro_app_login/src/configs/translator.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.blue),
          child: TextWidget(
            translate: () => MicroAppLoginTranslator.translate(key: 'login'),
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
