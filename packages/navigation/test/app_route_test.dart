import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:navigation/navigation.dart';

void main() {
  testWidgets('Should create page route with path and widget builder', (
    tester,
  ) async {
    final route = AppRoute.page(
      path: '/example',
      builder: (_) => const Text('Example'),
    );

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Builder(builder: (context) => route.builder(context, null)),
      ),
    );

    expect(route.path, '/example');
    expect(find.text('Example'), findsOneWidget);
  });
}
