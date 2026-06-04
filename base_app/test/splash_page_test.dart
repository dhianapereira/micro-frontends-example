import 'package:base_app/src/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Should display loading indicator', (tester) async {
    await tester.pumpWidget(
      MaterialApp(home: SplashPage(onReady: () async {})),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Should call onReady when initialized', (tester) async {
    var wasCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: SplashPage(
          onReady: () async {
            wasCalled = true;
          },
        ),
      ),
    );
    await tester.pump();

    expect(wasCalled, isTrue);
  });
}
