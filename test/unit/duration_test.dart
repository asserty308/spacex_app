import 'package:flutter_test/flutter_test.dart';
import 'package:spacex_guide/core/extensions/duration.dart';

void main() {
  test('Test 10 days', () {
    expect(24.toHours(), const Duration(days: 1));
  });
}