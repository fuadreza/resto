import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/feature/resto/data/response/local/restaurant/local_restaurant_dto.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('test if parsing json is successful', () async {
    // arrange
    final localJson = json.decode(await rootBundle.loadString('assets/local_restaurant.json'));

    // act
    final dto = LocalRestaurantDto.fromJson(localJson);
    final restaurants = dto.restaurants;

    // assert
    final isNotEmpty = restaurants.isNotEmpty;
    expect(isNotEmpty, true);
  });
}
