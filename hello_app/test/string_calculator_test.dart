import 'package:flutter_test/flutter_test.dart';
import 'package:your_app_name/main.dart';

void main() {
  test('Empty string should return 0', () {
    expect(add(""), 0);
  });

  test('Single number should return itself', () {
    expect(add("1"), 1);
  });

  test('Two numbers separated by comma should return sum', () {
    expect(add("1,5"), 6);
  });

  // Add tests for new lines, custom delimiters, negative numbers, etc.
}