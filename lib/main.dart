import 'package:incubyte_tdd_assignment/exceptions.dart';

import 'utils.dart' as utils;

void main(List<String> arguments) {
  print("--------------------------------");
  print("Incubyte TDD Assessment");
  print("--------------------------------");
  if (arguments.isNotEmpty) {
    try {
      String numbers = arguments.first;

      // when passing \n from command line, it is escaped to \\n, so we need to replace it with \n
      numbers = numbers.replaceAll('\\n', '\n');

      final result = add(numbers);
      print("Result: $result");
    } on NegativeNumberException catch (e) {
      print("Negative numbers not allowed: ${e.negativeNumbers}");
    } catch (e) {
      print("An unknown error occurred: $e");
    }
  } else {
    print("No arguments provided");
  }
}

int add(String numbers) {
  if (numbers.trim().isEmpty) {
    return 0;
  }

  var (String? customDelimiter, String numbersString) = splitDelimiter(numbers);

  // Extract numbers into a <String>[]
  final numbersList = <String>[];
  if (customDelimiter == null) {
    numbersString = numbersString.replaceAll('\n', ',');
    numbersList.addAll(numbersString.split(','));
  } else {
    numbersList.addAll(numbersString.split(customDelimiter));
  }

  // convert <String>[] into <int>[]
  final parsedNumbers = numbersList.map(int.parse);

  print("Parsed numbers: $parsedNumbers");

  checkForNegatives(parsedNumbers);

  final sum = parsedNumbers.reduce(utils.add);
  return sum;
}

void checkForNegatives(Iterable<int> numbers) {
  final negatives = numbers.where((n) => n.isNegative);
  if (negatives.isNotEmpty) {
    throw NegativeNumberException(negatives);
  }
}

(String? delimiter, String numbers) splitDelimiter(String numbers) {
  if (numbers.startsWith('//')) {
    final newLineIndex = numbers.indexOf('\n');
    final delimiter = numbers.substring(2, newLineIndex);
    print("Found delimiter '$delimiter'");
    return (delimiter, numbers.substring(newLineIndex + 1));
  }
  return (null, numbers);
}
