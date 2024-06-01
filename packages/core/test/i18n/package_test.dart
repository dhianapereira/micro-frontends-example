import 'dart:ui';

import 'package:core/core.dart';
import 'package:core/i18n/src/services/locale_service_impl.dart';
import 'package:core/i18n/src/services/translator_impl.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWidgetsBinding extends Mock implements WidgetsBinding {}

class MockPlatformDispatcher extends Mock implements PlatformDispatcher {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late WidgetsBinding widgetsBinding;
  late PlatformDispatcher platformDispatcher;
  late I18nPackage i18nPackage;

  setUp(() {
    widgetsBinding = MockWidgetsBinding();
    platformDispatcher = MockPlatformDispatcher();
    when(() => widgetsBinding.platformDispatcher).thenReturn(
      platformDispatcher,
    );
    when(() => platformDispatcher.locale).thenReturn(const Locale('en', 'US'));
    i18nPackage = I18nPackage();
  });

  tearDown(() {
    GetIt.I.reset();
  });

  test('Should register LocaleService and Translator correctly', () async {
    await i18nPackage.injectionsRegister();
    final localeService = GetIt.I<LocaleService>();
    final translator = GetIt.I<Translator>();
    expect(localeService, isA<LocaleServiceImpl>());
    expect(translator, isA<TranslatorImpl>());
  });

  test('Should register services with correct initial locale', () async {
    await i18nPackage.injectionsRegister();
    final localeService = GetIt.I<LocaleService>();
    expect(localeService.currentLocale, const Locale('en', 'US'));
  });
}
