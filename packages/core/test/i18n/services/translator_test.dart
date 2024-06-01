import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:core/i18n/src/services/translator_impl.dart';

import '../utils/test_mocks.dart';

void main() {
  late LocaleService localeService;
  late TranslatorImpl translator;

  const packageName = 'test';

  setUp(() {
    localeService = MockLocaleService();
    translator = TranslatorImpl(localeService);

    Translator.addTexts(packageName, {
      const Locale('en', 'US'): {
        'hello': 'Hello',
        'greet': 'Hello %s!',
      },
      const Locale('pt', 'BR'): {
        'hello': 'Olá',
        'greet': 'Olá %s!',
      },
    });
  });

  group('translate -', () {
    test(
      'Should return translated text when locale is en_US',
      () {
        when(() => localeService.currentLocale).thenReturn(
          const Locale('en', 'US'),
        );
        final result = translator.translate(
          key: 'hello',
          packageName: packageName,
        );
        expect(result, 'Hello');
      },
    );

    test('Should return key when key does not exist', () {
      when(() => localeService.currentLocale).thenReturn(
        const Locale('en', 'US'),
      );
      final result = translator.translate(
        key: 'non_existent_key',
        packageName: packageName,
      );
      expect(result, 'non_existent_key');
    });

    test(
      'Should return translated text with arguments when locale is en_US',
      () {
        when(() => localeService.currentLocale).thenReturn(
          const Locale('en', 'US'),
        );
        final result = translator.translate(
          key: 'greet',
          packageName: packageName,
          args: ['World'],
        );
        expect(result, 'Hello World!');
      },
    );

    test('Should return translated text when locale is pt_BR', () {
      when(() => localeService.currentLocale).thenReturn(
        const Locale('pt', 'BR'),
      );
      final result = translator.translate(
        key: 'hello',
        packageName: packageName,
      );
      expect(result, 'Olá');
    });

    test(
      'Should return translated text with arguments when locale is pt_BR',
      () {
        when(() => localeService.currentLocale).thenReturn(
          const Locale('pt', 'BR'),
        );
        final result = translator.translate(
          key: 'greet',
          packageName: packageName,
          args: ['Mundo'],
        );
        expect(result, 'Olá Mundo!');
      },
    );
  });
}
