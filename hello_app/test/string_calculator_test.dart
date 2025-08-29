import 'package:flutter_test/flutter_test.dart';
import 'package:hello_app/string_calculator.dart';

void main() {
  StringCalculator calculator = StringCalculator();

  // Test Case 1: Empty string returns 0
  test('Empty string should return 0', () {
    expect(calculator.add(""), 0);
  });

  // Test Case 2: Single number returns itself
  test('Single number should return itself', () {
    expect(calculator.add("1"), 1);
  });

  // Test Case 3: Two numbers separated by comma returns sum
  test('Two numbers separated by comma should return sum', () {
    expect(calculator.add("1,5"), 6);
  });

  // Test Case 4: Custom delimiter support
  test('Custom delimiter should work', () {
    expect(calculator.add("//;\n1;2"), 3);
  });

  // Test Case 5: New lines as delimiters
  test('New lines as delimiters should work', () {
    expect(calculator.add("1\n2,3"), 6);
  });

  // Test Case 6: Any amount of numbers
  test('Multiple numbers should return sum', () {
    expect(calculator.add("1,2,3,4"), 10);
  });

  // Test Case 7: Negative numbers throw exception
  test('Negative number should throw exception', () {
    expect(() => calculator.add("-1"), throwsA(isA<FormatException>()));
    expect(() => calculator.add("1,-2,3,-4"), throwsA(contains("negative numbers not allowed -2,-4")));
  });
}