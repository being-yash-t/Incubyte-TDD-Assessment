import 'package:incubyte_tdd_assignment/exceptions.dart';
import 'package:incubyte_tdd_assignment/main.dart';
import 'package:test/test.dart';

void main() {
  group('Add: ', () {
    group('Functionality', () {
      test('should return 0 when add is called with empty string', () {
        // arrage
        final emptyString = '';

        // act
        final result = add(emptyString);

        // verify
        expect(result, 0);
      });

      test('should return a 1 when add is called with "1"', () {
        // arrange
        final numberString = '1';

        // act
        final result = add(numberString);

        // verify
        expect(result, int.parse(numberString));
      });

      test('should return 6 when add is called with "1,5"', () {
        // arrange
        final numbersString = "1,5";

        // act
        final result = add(numbersString);

        // verify
        expect(result, 6);
      });

      test('should return 6 when add is called with "//;\n1;5"', () {
        // arrange
        final numbersString = "//;\n1;5";

        // act
        final result = add(numbersString);

        // verify
        expect(result, 6);
      });

      test('should return 7 when add is called with "1,5\n1"', () {
        // arrange
        final numbersString = "1,5\n1";

        // act
        final result = add(numbersString);

        // verify
        expect(result, 7);
      });
    });

    group('Error Handling', () {
      test(
        'should throw [NegativeNumberException] when input has any negative number',
        () {
          // arrage
          final numbersString = "1,2,-1,0";

          int call() => add(numbersString);

          // verify
          expect(call, throwsA(TypeMatcher<NegativeNumberException>()));
        },
      );
    });
  });

  group('checkForNegatives', () {
    test(
      'should throw [NegativeNumberException] when input has any negative number',
      () {
        // arrage
        final numbers = [1, 2, -1, 0];

        void call() => checkForNegatives(numbers);

        // verify
        expect(call, throwsA(TypeMatcher<NegativeNumberException>()));
      },
    );

    test(
      'should execute successfully without any error when no negative number is passed',
      () {
        // arrage
        final numbers = [1, 2];

        void call() => checkForNegatives(numbers);

        // verify
        expect(call, returnsNormally);
      },
    );
  });

  group('splitDelimiter', () {
    test('should return null,[1,2,3] if theres no delimiter in the string', () {
      final inputString = "1,2,3";

      final (delimiterResult, numbersResult) = splitDelimiter(inputString);

      expect(delimiterResult, null);
      expect(numbersResult, '1,2,3');
    });

    test('should return ;; delimiter present in the string', () {
      final inputString = "//;;\n1;;2;;3";

      final (delimiterResult, numbersResult) = splitDelimiter(inputString);

      expect(delimiterResult, ';;');
      expect(numbersResult, '1;;2;;3');
    });
  });
}
