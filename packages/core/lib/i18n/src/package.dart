import 'package:core/core.dart';
import 'package:core/i18n/src/services/locale_service_impl.dart';
import 'package:core/i18n/src/services/translator_impl.dart';
import 'package:dependencies/dependencies.dart';

class I18nPackage implements Package {
  @override
  Future<void> injectionsRegister() async {
    GetIt.I.registerSingleton<LocaleService>(LocaleServiceImpl());
    GetIt.I.registerSingleton<Translator>(
      TranslatorImpl(GetIt.I<LocaleService>()),
    );
  }

  @override
  String get packageName => 'i18n';
}
