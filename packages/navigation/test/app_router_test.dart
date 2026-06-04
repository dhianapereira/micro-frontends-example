import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:navigation/navigation.dart';

void main() {
  test('throws when routes have duplicated paths', () {
    expect(
      () => AppRouter(routes: [_route('/home'), _route('/home')]),
      throwsStateError,
    );
  });

  test('throws when a route uses the shell root path', () {
    expect(() => AppRouter(routes: [_route('/')]), throwsStateError);
  });
}

AppRoute _route(String path) =>
    AppRoute.page(path: path, builder: (_) => const SizedBox.shrink());
