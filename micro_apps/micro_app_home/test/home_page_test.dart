import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_home/src/home_page.dart';
import 'package:micro_app_home/src/l10n/l10n.dart';

void main() {
  testWidgets('Should display translated text', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates:
            MicroAppHomeLocalizations.localizationsDelegates,
        supportedLocales: MicroAppHomeLocalizations.supportedLocales,
        home: HomePage(),
      ),
    );

    expect(find.text('Hello, World'), findsOneWidget);
  });
}
