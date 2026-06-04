import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation/src/app_route.dart';

class AppRouter {
  AppRouter({required Iterable<AppRoute> routes, String initialLocation = '/'})
    : _router = GoRouter(
        initialLocation: initialLocation,
        routes: [
          GoRoute(path: '/', redirect: (_, _) => '/login'),
          ..._deduplicatedRoutes(routes).map(
            (route) => GoRoute(
              path: route.path,
              builder: (context, state) => route.builder(context, state),
            ),
          ),
        ],
      );

  final GoRouter _router;

  RouterConfig<Object> get config => _router;

  void go(String location) {
    _router.go(location);
  }

  static List<AppRoute> _deduplicatedRoutes(Iterable<AppRoute> routes) {
    final routesByPath = <String, AppRoute>{};
    const reservedPaths = {'/'};

    for (final route in routes) {
      if (reservedPaths.contains(route.path)) {
        throw StateError(
          'Route "${route.path}" is reserved by the shell and cannot be '
          'registered by a micro app.',
        );
      }

      final previousRoute = routesByPath[route.path];
      if (previousRoute != null) {
        throw StateError('Duplicated route "${route.path}" found.');
      }

      routesByPath[route.path] = route;
    }

    return routesByPath.values.toList(growable: false);
  }
}
