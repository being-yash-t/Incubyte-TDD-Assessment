class NegativeNumberException implements Exception {
  final Iterable<int> negativeNumbers;

  const NegativeNumberException(this.negativeNumbers);

  @override
  String toString() =>
      "NegativeNumberException: negative numbers not allowed $negativeNumbers";
}
