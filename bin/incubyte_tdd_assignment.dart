import 'package:incubyte_tdd_assignment/handle_input.dart';
import 'package:incubyte_tdd_assignment/core/exceptions.dart';

void main(List<String> arguments) {
  print("--------------------------------");
  print("Incubyte TDD Assessment");
  print("--------------------------------");
  if (arguments.isNotEmpty) {
    try {
      String numbers = arguments.first;

      // when passing \n from command line, it is escaped to \\n, so we need to replace it with \n
      numbers = numbers.replaceAll('\\n', '\n');

      final result = handleInput(numbers);
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
