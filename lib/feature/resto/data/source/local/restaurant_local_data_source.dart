import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:resto/feature/resto/data/response/local/restaurant/local_detail_restaurant_dto.dart';
import 'package:resto/feature/resto/data/response/local/restaurant/local_restaurant_dto.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/detail_restaurant.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/restaurant.dart';

abstract class RestaurantLocalDataSource {
  Future<List<Restaurant>> getRestaurants();

  Future<DetailRestaurant> getDetailRestaurant(String restaurantId);
}

class RestaurantLocalDataSourceImpl implements RestaurantLocalDataSource {
  @override
  Future<List<Restaurant>> getRestaurants() async {
    try {
      final localJson = json.decode(await getJson());
      final dto = LocalRestaurantDto.fromJson(localJson);
      return dto.restaurants;
    } on Error {
      throw Exception();
    }
  }

  @override
  Future<DetailRestaurant> getDetailRestaurant(String restaurantId) async {
    final localJson = json.decode(await getJson());
    final dto = LocalDetailRestaurantDto.fromJson(localJson);
    try {
      var filteredItem = dto.restaurants.where((item) => item.id == restaurantId).toList();
      return filteredItem[0];
    } on RangeError {
      throw Exception();
    }
  }

  Future<String> getJson() async {
    return await rootBundle.loadString('assets/local_restaurant.json');
  }
}
