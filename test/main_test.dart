import 'package:incubyte_tdd_assignment/main.dart';
import 'package:test/test.dart';

void main() {
  group('Add Functionality', () {
    test('should return 0 when add is called with empty string', () {
      // arrage
      final emptyString = '';

      // act
      final result = add(emptyString);

      // verify
      expect(result, 0);
    });

    test('should return a 1 when add is called with \"1\"', () {
      // arrange
      final numberString = '1';

      // act
      final result = add(numberString);

      // verify
      expect(result, int.parse(numberString));
    });
  });
}
