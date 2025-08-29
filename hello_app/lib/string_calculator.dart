class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0; // Test Case 1: Empty string returns 0

    String delimiter = ",";
    if (numbers.startsWith("//")) { // Test Case 4: Handle custom delimiter
      int newLineIndex = numbers.indexOf("\n");
      delimiter = numbers.substring(2, newLineIndex);
      numbers = numbers.substring(newLineIndex + 1);
    }

    numbers = numbers.replaceAll("\n", delimiter); // Test Case 5: Handle new lines

    List<String> numArray = numbers.split(delimiter); // Test Case 6: Handle any amount of numbers
    List<int> numbersList = [];

    for (String num in numArray) {
      if (num.trim().isNotEmpty) {
        int number = int.parse(num.trim());
        if (number < 0) { // Test Case 7: Throw exception for negative numbers
          throw FormatException(
              "negative numbers not allowed ${numArray.where((n) => int.parse(n.trim()) < 0).join(',')}");
        }
        numbersList.add(number);
      }
    }

    return numbersList.isNotEmpty ? numbersList.reduce((a, b) => a + b) : 0; // Test Case 8: Return sum
  }
}