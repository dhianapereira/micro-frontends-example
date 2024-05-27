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
          child: Text(MicroAppLoginTranslator.translate(key: 'login')),
          onPressed: () => EventBus.emit(EventType.authSuccess),
        ),
      ),
    );
  }
}
