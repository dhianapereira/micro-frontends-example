import 'package:base_app/src/configs/constants.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should return correct packageName', () {
    expect(Constants.packageName, 'base_app');
  });
}
