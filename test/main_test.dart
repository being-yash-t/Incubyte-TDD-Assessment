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
  });
}
