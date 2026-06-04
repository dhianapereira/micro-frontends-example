import 'package:flutter/material.dart';
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

  test('implements the app navigator contract', () {
    final router = AppRouter(rootRoute: _route('/'), routes: [_route('/home')]);

    expect(router, isA<AppNavigator>());
  });

  testWidgets('exposes app navigation from build context', (tester) async {
    final router = AppRouter(
      rootRoute: AppRoute.page(
        path: '/',
        builder: (context) => GestureDetector(
          onTap: () => context.appNavigator.go('/details'),
          child: const Text('Open details'),
        ),
      ),
      routes: [
        AppRoute.page(path: '/details', builder: (_) => const Text('Details')),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router.config));

    expect(find.text('Open details'), findsOneWidget);

    await tester.tap(find.text('Open details'));
    await tester.pumpAndSettle();

    expect(find.text('Details'), findsOneWidget);
  });
}

AppRoute _route(String path) =>
    AppRoute.page(path: path, builder: (_) => const SizedBox.shrink());
