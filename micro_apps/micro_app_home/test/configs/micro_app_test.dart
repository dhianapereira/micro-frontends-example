import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_home/src/configs/constants.dart';
import 'package:micro_app_home/src/configs/i18n.dart';
import 'package:micro_app_home/src/configs/micro_app.dart';
import 'package:micro_app_home/src/configs/translator.dart';
import 'package:micro_app_home/src/home_page.dart';

import '../utils/test_mocks.dart';

void main() {
  late MicroAppHome microApp;
  late Translator translator;
  late MicroAppHomeTranslator microAppHomeTranslator;

  setUp(() {
    translator = MockTranslator();
    microAppHomeTranslator = MockMicroAppHomeTranslator();
    microApp = MicroAppHome();
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
    expect(GetIt.I.isRegistered<MicroAppHomeTranslator>(), isTrue);
  });

  test('Should have correct i18n instance', () {
    expect(microApp.i18n, isA<MicroAppHomeI18n>());
  });

  test('Should return correct routes', () {
    GetIt.I.registerSingleton<MicroAppHomeTranslator>(microAppHomeTranslator);
    final routes = microApp.routes;
    expect(routes.containsKey('/home'), isTrue);
    final context = MockBuildContext();
    expect(routes['/home']!(context, null), isA<HomePage>());
  });
}
