import 'package:commons/commons.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_home/src/configs/translator.dart';
import 'package:micro_app_home/src/home_page.dart';
import 'package:mocktail/mocktail.dart';

import 'utils/test_mocks.dart';

void main() {
  late MicroAppHomeTranslator translator;
  late LocaleService localeService;

  setUp(() {
    translator = MockMicroAppHomeTranslator();
    localeService = MockLocaleService();
    GetIt.I.registerSingleton<LocaleService>(localeService);
    GetIt.I.registerSingleton<MicroAppHomeTranslator>(translator);
  });

  tearDown(() {
    GetIt.I.reset();
  });

  testWidgets('Should display translated text', (tester) async {
    when(() => localeService.listenable).thenReturn(
      ValueNotifier(const Locale('en', 'US')),
    );
    when(
      () => translator.translate(
        key: 'greetings',
        args: ['World'],
      ),
    ).thenReturn('Hello, World');
    await tester.pumpWidget(MaterialApp(home: HomePage()));
    final widget =
        find.byType(TextWidget).evaluate().single.widget as TextWidget;
    final text = widget.translate();
    expect(text, equals('Hello, World'));
  });
}
