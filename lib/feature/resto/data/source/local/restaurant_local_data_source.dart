import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:resto/feature/resto/data/response/restaurant/detail_restaurant_dto.dart';
import 'package:resto/feature/resto/data/response/restaurant/restaurant_dto.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/detail_restaurant.dart';

abstract class RestaurantLocalDataSource {
  Future<RestaurantDto> getRestaurants();

  Future<DetailRestaurant> getDetailRestaurant(String restaurantId);
}

class RestaurantLocalDataSourceImpl implements RestaurantLocalDataSource {
  @override
  Future<RestaurantDto> getRestaurants() async {
    var localJson = json.decode(await getJson());
    return RestaurantDto.fromJson(localJson);
  }

  @override
  Future<DetailRestaurant> getDetailRestaurant(String restaurantId) async {
    var localJson = json.decode(await getJson());
    var dto = DetailRestaurantDto.fromJson(localJson);
    var filteredItem = dto.restaurants.where((item) => item.id == restaurantId).toList();
    return filteredItem[0];
  }

  Future<String> getJson() async {
    return await rootBundle.loadString('assets/local_restaurant.json');
  }
}
