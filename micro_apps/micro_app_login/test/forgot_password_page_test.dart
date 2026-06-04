import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_login/src/forgot_password_page.dart';
import 'package:micro_app_login/src/l10n/l10n.dart';
import 'package:micro_app_login/src/login_page.dart';
import 'package:navigation/navigation.dart';

void main() {
  testWidgets('Should display forgot password content', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates:
            MicroAppLoginLocalizations.localizationsDelegates,
        supportedLocales: MicroAppLoginLocalizations.supportedLocales,
        home: ForgotPasswordPage(),
      ),
    );

    expect(find.text('Forgot password'), findsOneWidget);
    expect(find.text('Back to login'), findsOneWidget);
  });

  testWidgets('Should navigate back to login', (tester) async {
    final router = AppRouter(
      rootRoute: AppRoute.page(path: '/', builder: (_) => const LoginPage()),
      routes: [
        AppRoute.page(
          path: '/login/forgot-password',
          builder: (_) => const ForgotPasswordPage(),
        ),
      ],
    );

    await tester.pumpWidget(
      MaterialApp.router(
        localizationsDelegates:
            MicroAppLoginLocalizations.localizationsDelegates,
        supportedLocales: MicroAppLoginLocalizations.supportedLocales,
        routerConfig: router.config,
      ),
    );

    await tester.tap(find.byKey(const ValueKey('forgot-password-button')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey('back-to-login-button')));
    await tester.pumpAndSettle();

    expect(find.text('Login'), findsOneWidget);
  });
}
