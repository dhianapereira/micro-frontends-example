import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_home/src/configs/constants.dart';
import 'package:micro_app_home/src/configs/micro_app.dart';

void main() {
  late MicroAppHome microApp;

  setUp(() {
    microApp = MicroAppHome();
  });

  test('Should return correct microAppName', () {
    expect(microApp.microAppName, Constants.microAppName);
  });

  test('Should register dependencies without errors', () async {
    await microApp.injectionsRegister();
  });

  test('Should return correct routes', () {
    final routes = microApp.routes;
    expect(routes, hasLength(1));
    expect(routes.single.path, '/home');
  });
}
