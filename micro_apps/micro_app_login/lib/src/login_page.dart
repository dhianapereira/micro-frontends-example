import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:micro_app_login/src/events/auth_success_event.dart';
import 'package:micro_app_login/src/l10n/l10n.dart';
import 'package:navigation/navigation.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              key: const ValueKey('login-button'),
              style: TextButton.styleFrom(backgroundColor: Colors.blue),
              child: Text(
                context.l10n.login,
                textAlign: TextAlign.start,
                style: const TextStyle(color: Colors.white),
              ),
              onPressed: () {
                EventBus.emit(const AuthSuccessEvent());
              },
            ),
            const SizedBox(height: 12),
            TextButton(
              key: const ValueKey('forgot-password-button'),
              onPressed: () {
                context.appNavigator.push('/login/forgot-password');
              },
              child: Text(context.l10n.forgotPassword),
            ),
          ],
        ),
      ),
    );
  }
}
