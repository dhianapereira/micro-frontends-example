import 'package:flutter/material.dart';
import 'package:micro_app_login/src/l10n/l10n.dart';
import 'package:navigation/navigation.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.l10n.forgotPasswordTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 12),
              Text(
                context.l10n.forgotPasswordDescription,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              TextButton(
                key: const ValueKey('back-to-login-button'),
                onPressed: () {
                  context.appNavigator.pop();
                },
                child: Text(context.l10n.backToLogin),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
