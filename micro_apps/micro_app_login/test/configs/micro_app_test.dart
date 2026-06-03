import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_login/micro_app_login.dart';
import 'package:micro_app_login/src/configs/constants.dart';
import 'package:micro_app_login/src/configs/i18n.dart';
import 'package:micro_app_login/src/configs/translator.dart';
import 'package:micro_app_login/src/login_page.dart';

import '../utils/test_mocks.dart';

void main() {
  late MicroAppLogin microApp;
  late Translator translator;
  late MicroAppLoginTranslator microAppLoginTranslator;

  setUp(() {
    translator = MockTranslator();
    microAppLoginTranslator = MockMicroAppLoginTranslator();
    microApp = MicroAppLogin();
  });

  tearDown(() async {
    await GetIt.I.reset();
  });

  test('Should return correct microAppName', () {
    expect(microApp.microAppName, Constants.microAppName);
  });

  test('Should register all dependencies correctly', () async {
    GetIt.I.registerSingleton<Translator>(translator);
    await microApp.injectionsRegister();
    expect(GetIt.I.isRegistered<MicroAppLoginTranslator>(), isTrue);
  });

  test('Should have correct i18n instance', () {
    expect(microApp.i18n, isA<MicroAppLoginI18n>());
  });

  test('Should return correct routes', () {
    GetIt.I.registerSingleton<MicroAppLoginTranslator>(microAppLoginTranslator);
    final routes = microApp.routes;
    expect(routes.containsKey('/login'), isTrue);
    final context = MockBuildContext();
    expect(routes['/login']!(context, null), isA<LoginPage>());
  });
}
