void main(List<String> arguments) {}

int addReducer(int n1, int n2) => n1 + n2;

int add(String numbers) {
  if (numbers.trim().isEmpty) {
    return 0;
  }

  final numbersList = numbers.split(',');
  final parsedNumbers = numbersList.map(int.parse);
  final sum = parsedNumbers.reduce(addReducer);
  return sum;
}
