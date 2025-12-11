import 'package:incubyte_tdd_assignment/exceptions.dart';

import 'utils.dart' as utils;

void main(List<String> arguments) {}

int add(String numbers) {
  if (numbers.trim().isEmpty) {
    return 0;
  }

  final numbersList = numbers.split(',');
  final parsedNumbers = numbersList.map(int.parse);

  final negatives = parsedNumbers.where((n) => n.isNegative);
  if (negatives.isNotEmpty) {
    final exception = NegativeNumberException(negatives);
    print(exception);
    throw exception;
  }

  final sum = parsedNumbers.reduce(utils.add);
  return sum;
}
