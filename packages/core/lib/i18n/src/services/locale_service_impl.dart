import 'package:core/i18n/src/services/locale_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LocaleServiceImpl implements LocaleService {
  final PlatformDispatcher _platformDispatcher;
  late final ValueNotifier<Locale> _notifier;

  LocaleServiceImpl(this._platformDispatcher) {
    _notifier = ValueNotifier(
      LocaleService.isSupported(_platformDispatcher.locale)
          ? _platformDispatcher.locale
          : const Locale('pt', 'BR'),
    );
  }

  @override
  ValueListenable<Locale> get listenable => _notifier;

  @override
  void update(Locale newLocale) {
    if (LocaleService.isSupported(newLocale)) {
      _notifier.value = newLocale;
    }
  }

  @override
  Locale get currentLocale => _notifier.value;
}
