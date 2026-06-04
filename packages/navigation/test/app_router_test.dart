import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:navigation/navigation.dart';

void main() {
  test('registers the root route', () {
    final router = AppRouter(rootRoute: _route('/'), routes: [_route('/home')]);

    expect(router.config, isNotNull);
  });

  test('throws when routes have duplicated paths', () {
    expect(
      () => AppRouter(
        rootRoute: _route('/'),
        routes: [_route('/home'), _route('/home')],
      ),
      throwsStateError,
    );
  });

  test('throws when a route uses the shell root path', () {
    expect(
      () => AppRouter(rootRoute: _route('/'), routes: [_route('/')]),
      throwsStateError,
    );
  });

  test('throws when root route does not use the shell root path', () {
    expect(
      () => AppRouter(rootRoute: _route('/splash'), routes: [_route('/home')]),
      throwsStateError,
    );
  });
}

AppRoute _route(String path) =>
    AppRoute.page(path: path, builder: (_) => const SizedBox.shrink());
