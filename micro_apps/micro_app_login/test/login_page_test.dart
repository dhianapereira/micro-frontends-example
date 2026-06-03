import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_login/src/l10n/l10n.dart';
import 'package:micro_app_login/src/login_page.dart';

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

    final button = tester.widget<TextButton>(find.byType(TextButton));
    expect(button.style?.backgroundColor?.resolve({}), Colors.blue);
  });
}
