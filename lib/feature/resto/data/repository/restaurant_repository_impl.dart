import 'package:resto/core/error/failures.dart';
import 'package:resto/feature/resto/data/source/local/restaurant_local_data_source.dart';
import 'package:resto/feature/resto/data/source/remote/restaurant_remote_data_source.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/detail_restaurant.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/restaurant.dart';
import 'package:resto/feature/resto/domain/repository/restaurant_repository.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  final RestaurantLocalDataSource localDataSource;
  final RestaurantRemoteDataSource remoteDataSource;

  RestaurantRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<List<Restaurant>> getRestaurants() async {
    try {
      return await remoteDataSource.getRestaurants();
    } on ServerFailure {
      return await localDataSource.getRestaurants();
    }
  }

  @override
  Future<DetailRestaurant> getDetailRestaurant(String restaurantId) async {
    try {
      return await remoteDataSource.getDetailRestaurant(restaurantId);
    } on ServerFailure {
      return await localDataSource.getDetailRestaurant(restaurantId);
    }
  }

  @override
  Future<List<Restaurant>> searchRestaurant(String keyword) async {
    try {
      return await remoteDataSource.searchRestaurant(keyword);
    } on ServerFailure {
      return await localDataSource.searchRestaurant(keyword);
    }
  }

  @override
  Future<List<Restaurant>> getFavoriteRestaurants() async {
    try {
      return await localDataSource.getFavoriteRestaurants();
    } on Exception {
      throw CacheFailure;
    }
  }

  @override
  Future<String> setFavoriteRestaurant(Restaurant restaurant) async {
    try {
      return await localDataSource.setFavoriteRestaurant(restaurant);
    } on Exception {
      throw CacheFailure;
    }
  }
}
