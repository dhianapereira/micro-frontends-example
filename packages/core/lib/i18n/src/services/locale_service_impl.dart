import 'package:core/i18n/src/services/locale_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LocaleServiceImpl implements LocaleService {
  final ValueNotifier<Locale> _notifier = ValueNotifier(
    LocaleService.isSupported(WidgetsBinding.instance.platformDispatcher.locale)
        ? WidgetsBinding.instance.platformDispatcher.locale
        : const Locale('pt', 'BR'),
  );

  @override
  ValueListenable<Locale> get listenable => _notifier;

  @override
  void update(Locale newLocale) {
    _notifier.value = newLocale;
  }

  @override
  Locale get currentLocale => _notifier.value;
}
