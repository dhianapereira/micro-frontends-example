import 'package:flutter/material.dart';
import 'package:micro_app_home/src/configs/translator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          MicroAppHomeTranslator.translate(key: 'greetings', args: ['World']),
        ),
      ),
    );
  }
}
