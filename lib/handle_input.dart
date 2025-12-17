import 'core/exceptions.dart' as exceptions;
import 'core/utils.dart' as utils;

int handleInput(String numbers) {
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

  return parsedNumbers.reduce(
    customDelimiter == '*' ? utils.multiply : utils.add,
  );
}

void checkForNegatives(Iterable<int> numbers) {
  final negatives = numbers.where((n) => n.isNegative);
  if (negatives.isNotEmpty) {
    throw exceptions.NegativeNumberException(negatives);
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
