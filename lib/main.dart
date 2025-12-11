void main(List<String> arguments) {}

int add(String numbers) {
  if (numbers.trim().isEmpty) {
    return 0;
  }
  return int.parse(numbers);
}
