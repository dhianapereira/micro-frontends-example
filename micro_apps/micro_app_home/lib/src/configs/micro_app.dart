import 'package:foundations/foundations.dart';
import 'package:micro_app_home/src/configs/constants.dart';
import 'package:micro_app_home/src/home_page.dart';
import 'package:navigation/navigation.dart';

class MicroAppHome implements MicroApp {
  @override
  String get microAppName => Constants.microAppName;

  @override
  List<AppRoute> get routes => [
    AppRoute.page(path: '/home', builder: (_) => const HomePage()),
  ];

  @override
  Future<void> injectionsRegister() async {}

  @override
  void registerEventHandlers() {}
}
