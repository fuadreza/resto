import 'dart:convert';

import 'package:resto/core/error/exceptions.dart';
import 'package:resto/core/error/failures.dart';
import 'package:resto/feature/resto/data/response/remote/restaurant/detail_restaurant_dto.dart';
import 'package:resto/feature/resto/data/response/remote/restaurant/restaurant_dto.dart';
import 'package:resto/feature/resto/data/service/api/restaurant_service.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/detail_restaurant.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/restaurant.dart';

abstract class RestaurantRemoteDataSource {
  Future<List<Restaurant>> getRestaurants();

  Future<DetailRestaurant> getDetailRestaurant(String restaurantId);

  Future<List<Restaurant>> searchRestaurant(String keyword);
}

class RestaurantRemoteDataSourceImpl implements RestaurantRemoteDataSource {
  final RestaurantService restaurantService;

  RestaurantRemoteDataSourceImpl({required this.restaurantService});

  @override
  Future<List<Restaurant>> getRestaurants() async {
    try {
      final response = await restaurantService.getRestaurants();
      final dto = RestaurantDto.fromJson(jsonDecode(response));
      return dto.restaurants;
    } on ServerException {
      throw ServerFailure();
    }
  }

  @override
  Future<DetailRestaurant> getDetailRestaurant(String restaurantId) async {
    try {
      final response = await restaurantService.getDetailRestaurant(restaurantId);
      final dto = DetailRestaurantDto.fromJson(jsonDecode(response)['restaurant']);
      return dto;
    } on ServerException {
      throw ServerFailure();
    }
  }

  @override
  Future<List<Restaurant>> searchRestaurant(String keyword) async {
    try {
      final response = await restaurantService.searchRestaurant(keyword);
      final dto = RestaurantDto.fromJson(jsonDecode(response));
      return dto.restaurants;
    }on ServerException {
      throw ServerFailure();
    }
  }
}
