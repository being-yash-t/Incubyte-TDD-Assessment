import 'package:incubyte_tdd_assignment/exceptions.dart';

import 'utils.dart' as utils;

void main(List<String> arguments) {}

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

  checkForNegatives(parsedNumbers);

  final sum = parsedNumbers.reduce(utils.add);
  return sum;
}

void checkForNegatives(Iterable<int> numbers) {
  final negatives = numbers.where((n) => n.isNegative);
  if (negatives.isNotEmpty) {
    final exception = NegativeNumberException(negatives);
    print(exception);
    throw exception;
  }
}

(String? delimiter, String numbers) splitDelimiter(String numbers) {
  if (numbers.startsWith('//')) {
    final newLineIndex = numbers.indexOf('\n');
    final delimiter = numbers.substring(2, newLineIndex);
    return (delimiter, numbers.substring(newLineIndex + 1));
  }
  return (null, numbers);
}
