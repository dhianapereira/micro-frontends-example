import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_home/src/configs/constants.dart';

void main() {
  test('Should return micro_app_home when microAppName is called', () {
    const result = Constants.microAppName;
    expect(result, equals('micro_app_home'));
  });
}
