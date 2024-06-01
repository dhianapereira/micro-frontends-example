import 'package:core/core.dart';
import 'package:flutter/widgets.dart';
import 'package:micro_app_login/src/configs/translator.dart';
import 'package:mocktail/mocktail.dart';

class MockTranslator extends Mock implements Translator {}

class MockMicroAppLoginTranslator extends Mock
    implements MicroAppLoginTranslator {}

class MockBuildContext extends Mock implements BuildContext {}

class MockLocaleService extends Mock implements LocaleService {}
