import 'dart:convert';

import 'package:resto/feature/resto/data/response/remote/restaurant/restaurant_dto.dart';
import 'package:resto/feature/resto/data/service/restaurant_service.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/detail_restaurant.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/restaurant.dart';

abstract class RestaurantRemoteDataSource {
  Future<List<Restaurant>> getRestaurants();

  Future<DetailRestaurant> getDetailRestaurant(String restaurantId);
}

class RestaurantRemoteDataSourceImpl implements RestaurantRemoteDataSource {
  final RestaurantService restaurantService;

  RestaurantRemoteDataSourceImpl({required this.restaurantService});

  @override
  Future<DetailRestaurant> getDetailRestaurant(String restaurantId) {
    // TODO: implement getRestaurants
    throw UnimplementedError();
  }

  @override
  Future<List<Restaurant>> getRestaurants() async {
    final response = await restaurantService.getRestaurants();
    final dto = RestaurantDto.fromJson(jsonDecode(response));
    return dto.restaurants;
  }
}
