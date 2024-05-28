import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const packageName = 'test';

  setUpAll(() {
    Translator.addTexts(
      packageName,
      {
        const Locale('en'): {
          'hello': 'Hello',
          'greet': 'Hello %s!',
        },
        const Locale('pt', 'BR'): {
          'hello': 'Olá',
          'greet': 'Olá %s!',
        },
      },
    );
  });

  group('translate - ', () {
    test(
      'Should return value in Portuguese when translate method '
      'is called without arguments and Locale is pt_BR',
      () {
        final translator = Translator(const Locale('pt', 'BR'));
        expect(
          translator.translate(key: 'hello', packageName: packageName),
          'Olá',
        );
      },
    );

    test(
      'Should return value in English when translate method '
      'is called without arguments and Locale is en',
      () {
        final translator = Translator(const Locale('en'));
        expect(
          translator.translate(key: 'hello', packageName: packageName),
          'Hello',
        );
      },
    );

    test(
      'Should return value in Portuguese when translate method '
      'is called with arguments and Locale is pt_BR',
      () {
        final translator = Translator(const Locale('pt', 'BR'));
        expect(
          translator.translate(
            key: 'greet',
            packageName: packageName,
            args: ['Mundo'],
          ),
          'Olá Mundo!',
        );
      },
    );

    test(
      'Should return value in English when translate method '
      'is called with arguments and Locale is en',
      () {
        final translator = Translator(const Locale('en'));
        expect(
          translator.translate(
            key: 'greet',
            packageName: packageName,
            args: ['World'],
          ),
          'Hello World!',
        );
      },
    );

    test('Should return key when the key does not exist', () {
      final translator = Translator(const Locale('en'));
      expect(
        translator.translate(key: 'test', packageName: packageName),
        'test',
      );
    });
  });

  group('TranslatorDelegate - ', () {
    group('isSupported - ', () {
      test('Should have isSupported equal to true when Locale is pt_BR', () {
        const delegate = TranslatorDelegate();
        expect(delegate.isSupported(const Locale('pt', 'BR')), isTrue);
      });

      test('Should have isSupported equal to true when Locale is en', () {
        const delegate = TranslatorDelegate();
        expect(delegate.isSupported(const Locale('en')), isTrue);
      });

      test('Should have isSupported equal to false when Locale is es', () {
        const delegate = TranslatorDelegate();
        expect(delegate.isSupported(const Locale('es')), isFalse);
      });
    });

    group('load - ', () {
      test(
        'Should return locale equal to en when the load parameter is en',
        () async {
          const delegate = TranslatorDelegate();
          const locale = Locale('en');
          final translator = await delegate.load(locale);
          expect(translator.locale, locale);
        },
      );

      test(
        'Should return locale equal to pt_BR when the load parameter is pr_BR',
        () async {
          const delegate = TranslatorDelegate();
          const locale = Locale('pt', 'BR');
          final translator = await delegate.load(locale);
          expect(translator.locale, locale);
        },
      );

      test(
        'Should return locale equal to pt_BR when '
        'the load parameter is not supported',
        () async {
          const delegate = TranslatorDelegate();
          const locale = Locale('es');
          final translator = await delegate.load(locale);
          expect(translator.locale, const Locale('pt', 'BR'));
        },
      );
    });
  });
}
