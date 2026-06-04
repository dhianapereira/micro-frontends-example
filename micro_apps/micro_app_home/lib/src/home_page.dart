import 'package:flutter/material.dart';
import 'package:micro_app_home/src/l10n/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(context.l10n.greetings('World'))));
  }
}
