import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_login/micro_app_login.dart';
import 'package:micro_app_login/src/forgot_password_page.dart';
import 'package:micro_app_login/src/login_page.dart';
import 'package:navigation/navigation.dart';

void main() {
  testWidgets('Should display translated text on button', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates:
            MicroAppLoginLocalizations.localizationsDelegates,
        supportedLocales: MicroAppLoginLocalizations.supportedLocales,
        home: LoginPage(),
      ),
    );

    expect(find.text('Login'), findsOneWidget);
  });

  testWidgets('Button should have correct style', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates:
            MicroAppLoginLocalizations.localizationsDelegates,
        supportedLocales: MicroAppLoginLocalizations.supportedLocales,
        home: LoginPage(),
      ),
    );

    final button = tester.widget<TextButton>(
      find.byKey(const ValueKey('login-button')),
    );
    expect(button.style?.backgroundColor?.resolve({}), Colors.blue);
  });

  testWidgets('Should emit auth success event when button is tapped', (
    tester,
  ) async {
    final events = <AppEvent>[];
    final subscription = EventBus.listen((event) {
      events.add(event);
    });

    await tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates:
            MicroAppLoginLocalizations.localizationsDelegates,
        supportedLocales: MicroAppLoginLocalizations.supportedLocales,
        home: LoginPage(),
      ),
    );

    await tester.tap(find.byKey(const ValueKey('login-button')));
    await tester.pump();

    expect(events.whereType<AuthSuccessEvent>(), hasLength(1));
    subscription.cancel();
  });

  testWidgets('Should navigate to forgot password page', (tester) async {
    final router = AppRouter(
      rootRoute: AppRoute.page(path: '/', builder: (_) => const LoginPage()),
      routes: [
        AppRoute.page(path: '/login', builder: (_) => const LoginPage()),
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

    expect(find.text('Forgot password'), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('back-to-login-button')));
    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('login-button')), findsOneWidget);
  });
}
