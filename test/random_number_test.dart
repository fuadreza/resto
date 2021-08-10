import 'package:flutter_test/flutter_test.dart';
import 'package:resto/core/utils/random_util.dart';

void main() {
  test('should return random number from max number', () {
    // arrange
    final resultList = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

    // act
    final result = getRandom(10);

    // assert
    final isInAnswerList = resultList.contains(result);
    expect(isInAnswerList, true);
  });
}
