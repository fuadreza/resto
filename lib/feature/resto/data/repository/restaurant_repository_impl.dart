import 'package:resto/core/error/exceptions.dart';
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
      final result = await remoteDataSource.getRestaurants();
      return result;
    } on ServerFailure {
      final result = await localDataSource.getRestaurants();
      return result;
    }
  }

  @override
  Future<DetailRestaurant> getDetailRestaurant(String restaurantId) async {
    final result = await localDataSource.getDetailRestaurant(restaurantId);
    return result;
  }
}
