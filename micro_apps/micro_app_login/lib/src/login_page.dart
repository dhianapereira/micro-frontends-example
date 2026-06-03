import 'package:event_bus/event_bus.dart';
import 'package:foundations/foundations.dart';
import 'package:flutter/material.dart';
import 'package:micro_app_login/src/l10n/l10n.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.blue),
          child: Text(
            context.l10n.login,
            textAlign: TextAlign.start,
            style: const TextStyle(color: Colors.white),
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
