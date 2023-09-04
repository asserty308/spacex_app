import 'package:flutter_test/flutter_test.dart';
import 'package:spacex_guide/app/utility/int_extension.dart';

void main() {
  test('Test 1', () {
    final value = 1.toCommaSeparatedString();
    expect(value, '1');
  });

  test('Test 10', () {
    final value = 10.toCommaSeparatedString();
    expect(value, '10');
  });

  test('Test 100', () {
    final value = 100.toCommaSeparatedString();
    expect(value, '100');
  });
  test('Test 1000', () {
    final value = 1000.toCommaSeparatedString();
    expect(value, '1,000');
  });

  test('Test 10000', () {
    final value = 10000.toCommaSeparatedString();
    expect(value, '10,000');
  });

  test('Test 100000', () {
    final value = 100000.toCommaSeparatedString();
    expect(value, '100,000');
  });

  test('Test 1000000', () {
    final value = 1000000.toCommaSeparatedString();
    expect(value, '1,000,000');
  });
}