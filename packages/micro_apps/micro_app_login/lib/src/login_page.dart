import 'package:core/core.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text('Login'),
          onPressed: () => EventBus.emit(EventType.authSuccess),
        ),
      ),
    );
  }
}
