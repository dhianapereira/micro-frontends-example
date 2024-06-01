import 'dart:ui';

import 'package:core/i18n/src/services/locale_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../utils/test_mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late PlatformDispatcher platformDispatcher;

  setUp(() {
    platformDispatcher = MockPlatformDispatcher();
  });

  group('currentLocale - ', () {
    test(
      'Should have currentLocale equal to '
      'platform locale when it is supported',
      () {
        const locale = Locale('en', 'US');
        when(() => platformDispatcher.locale).thenReturn(locale);
        final service = LocaleServiceImpl(platformDispatcher);
        expect(service.currentLocale, locale);
      },
    );

    test(
      'Should currentLocale equal to pt_BR '
      'when platform locale is not supported',
      () {
        const locale = Locale('es', 'ES');
        when(() => platformDispatcher.locale).thenReturn(locale);
        final service = LocaleServiceImpl(platformDispatcher);
        expect(service.currentLocale, const Locale('pt', 'BR'));
      },
    );
  });

  group('update - ', () {
    test('Should update locale when update method is called', () {
      const localeEn = Locale('en', 'US');
      const localePt = Locale('pt', 'BR');
      when(() => platformDispatcher.locale).thenReturn(localeEn);
      final service = LocaleServiceImpl(platformDispatcher);
      expect(service.currentLocale, localeEn);
      service.update(localePt);
      expect(service.currentLocale, localePt);
    });

    test('Should not update locale when new locale is not supported', () {
      const localeEn = Locale('en', 'US');
      const localeEs = Locale('es');
      when(() => platformDispatcher.locale).thenReturn(localeEn);
      final service = LocaleServiceImpl(platformDispatcher);
      expect(service.currentLocale, localeEn);
      service.update(localeEs);
      expect(service.currentLocale, localeEn);
    });
  });

  test('Should notify listeners on update', () {
    const localeEn = Locale('en', 'US');
    const localePt = Locale('pt', 'BR');
    when(() => platformDispatcher.locale).thenReturn(localeEn);
    final service = LocaleServiceImpl(platformDispatcher);
    bool notified = false;
    service.listenable.addListener(() {
      notified = true;
    });
    service.update(localePt);
    expect(notified, true);
  });
}
