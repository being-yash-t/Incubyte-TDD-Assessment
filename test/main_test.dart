import 'package:test/test.dart';

void main() {
  group('Add Functionality', () {
    test('should return 0 when add is called with empty string', () {
      // arrage
      final inputString = '';

      // act
      final result = add(inputString);

      // verify
      expect(result, 0);
    });
  });
}
