import 'package:flutter/widgets.dart';

typedef AppRouteBuilder = Widget Function(BuildContext context, Object? state);

class AppRoute {
  const AppRoute({required this.path, required this.builder});

  factory AppRoute.page({
    required String path,
    required WidgetBuilder builder,
  }) {
    return AppRoute(path: path, builder: (context, _) => builder(context));
  }

  final String path;
  final AppRouteBuilder builder;
}
