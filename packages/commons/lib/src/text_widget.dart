import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String Function() translate;
  final Color color;

  const TextWidget({
    super.key,
    required this.translate,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: GetIt.I<LocaleService>().listenable,
      builder: (_, __, ___) {
        return Text(
          translate(),
          textAlign: TextAlign.start,
          style: TextStyle(color: color),
        );
      },
    );
  }
}
