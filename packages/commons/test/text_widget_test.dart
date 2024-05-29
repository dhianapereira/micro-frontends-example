import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

class MockLocaleService extends Mock implements LocaleService {}

void main() {
  late MockLocaleService mockLocaleService;

  setUp(() {
    mockLocaleService = MockLocaleService();

    when(() => mockLocaleService.listenable).thenReturn(
      ValueNotifier(const Locale('en')),
    );

    GetIt.I.registerSingleton<LocaleService>(mockLocaleService);
  });

  tearDown(() {
    GetIt.I.reset();
  });

  testWidgets(
    'Should render TextWidget displays the correct text',
    (tester) async {
      const text = 'Hello, World!';

      await tester.pumpWidget(
        MaterialApp(
          home:
              Scaffold(body: Center(child: TextWidget(translate: () => text))),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text(text), findsOneWidget);
    },
  );
}
