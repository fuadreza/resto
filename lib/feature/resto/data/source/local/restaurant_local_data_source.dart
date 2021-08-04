import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:resto/feature/resto/data/response/restaurant/restaurant_dto.dart';

abstract class RestaurantLocalDataSource {
  Future<RestaurantDto> getRestaurants();
}

class RestaurantLocalDataSourceImpl implements RestaurantLocalDataSource {
  @override
  Future<RestaurantDto> getRestaurants() async {
    var localJson = json.decode(await getJson());
    return RestaurantDto.fromJson(localJson);
  }

  Future<String> getJson() async {
    return await rootBundle.loadString('assets/local_restaurant.json');
  }
}
