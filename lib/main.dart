import 'utils.dart' as utils;

void main(List<String> arguments) {}

int add(String numbers) {
  if (numbers.trim().isEmpty) {
    return 0;
  }

  final numbersList = numbers.split(',');
  final parsedNumbers = numbersList.map(int.parse);
  final sum = parsedNumbers.reduce(utils.add);
  return sum;
}
