import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_login/micro_app_login.dart';
import 'package:micro_app_login/src/configs/constants.dart';

void main() {
  late MicroAppLogin microApp;

  setUp(() {
    microApp = MicroAppLogin();
  });

  test('Should return correct microAppName', () {
    expect(microApp.microAppName, Constants.microAppName);
  });

  test('Should register dependencies without errors', () async {
    await microApp.injectionsRegister();
  });

  test('Should return correct routes', () {
    final routes = microApp.routes;
    expect(routes, hasLength(2));
    expect(routes.map((route) => route.path), [
      '/login',
      '/login/forgot-password',
    ]);
  });
}
