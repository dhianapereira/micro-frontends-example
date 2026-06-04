import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

abstract class AppNavigator {
  void go(String location, {Object? extra});

  Future<T?> push<T extends Object?>(String location, {Object? extra});

  void pop<T extends Object?>([T? result]);

  bool canPop();
}

extension AppNavigatorBuildContext on BuildContext {
  AppNavigator get appNavigator => _GoRouterAppNavigator(GoRouter.of(this));
}

class _GoRouterAppNavigator implements AppNavigator {
  const _GoRouterAppNavigator(this._router);

  final GoRouter _router;

  @override
  void go(String location, {Object? extra}) {
    _router.go(location, extra: extra);
  }

  @override
  Future<T?> push<T extends Object?>(String location, {Object? extra}) {
    return _router.push<T>(location, extra: extra);
  }

  @override
  void pop<T extends Object?>([T? result]) {
    _router.pop(result);
  }

  @override
  bool canPop() {
    return _router.canPop();
  }
}
