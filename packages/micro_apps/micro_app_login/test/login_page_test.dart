import 'package:commons/commons.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_login/src/configs/translator.dart';
import 'package:micro_app_login/src/login_page.dart';
import 'package:mocktail/mocktail.dart';

import 'utils/test_mocks.dart';

void main() {
  late MicroAppLoginTranslator translator;
  late LocaleService localeService;

  setUp(() {
    localeService = MockLocaleService();
    translator = MockMicroAppLoginTranslator();
    GetIt.I.registerSingleton<LocaleService>(localeService);
    GetIt.I.registerSingleton<MicroAppLoginTranslator>(translator);
  });

  tearDown(() {
    GetIt.I.reset();
  });

  testWidgets('Should display translated text on button', (tester) async {
    when(() => localeService.listenable).thenReturn(
      ValueNotifier(const Locale('en', 'US')),
    );
    when(() => translator.translate(key: 'login')).thenReturn('Login');
    await tester.pumpWidget(
      MaterialApp(
        home: LoginPage(),
      ),
    );
    final widget =
        find.byType(TextWidget).evaluate().single.widget as TextWidget;
    final text = widget.translate();
    expect(text, equals('Login'));
  });

  testWidgets('Button should have correct style', (tester) async {
    when(() => localeService.listenable).thenReturn(
      ValueNotifier(const Locale('en', 'US')),
    );
    when(() => translator.translate(key: 'login')).thenReturn('Login');
    await tester.pumpWidget(MaterialApp(
      home: LoginPage(),
    ));
    final button = tester.widget<TextButton>(find.byType(TextButton));
    expect(button.style?.backgroundColor?.resolve({}), Colors.blue);
  });
}
