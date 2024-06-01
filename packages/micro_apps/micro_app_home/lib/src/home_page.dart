import 'package:commons/commons.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:micro_app_home/src/configs/translator.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final translator = GetIt.I<MicroAppHomeTranslator>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextWidget(
          translate: () => translator.translate(
            key: 'greetings',
            args: ['World'],
          ),
        ),
      ),
    );
  }
}
