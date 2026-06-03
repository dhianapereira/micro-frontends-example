import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:micro_app_home/src/configs/translator.dart';
import 'package:mocktail/mocktail.dart';

class MockTranslator extends Mock implements Translator {}

class MockMicroAppHomeTranslator extends Mock
    implements MicroAppHomeTranslator {}

class MockBuildContext extends Mock implements BuildContext {}

class MockLocaleService extends Mock implements LocaleService {}
