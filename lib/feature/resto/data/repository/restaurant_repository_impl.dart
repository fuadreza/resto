import 'package:resto/feature/resto/data/response/restaurant/restaurant_dto.dart';
import 'package:resto/feature/resto/data/source/local/restaurant_local_data_source.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/restaurant.dart';
import 'package:resto/feature/resto/domain/repository/restaurant_repository.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  final RestaurantLocalDataSource localDataSource;

  RestaurantRepositoryImpl({required this.localDataSource});

  @override
  Future<List<Restaurant>> getRestaurants() async {
    final RestaurantDto result = await localDataSource.getRestaurants();
    return result.restaurants;
  }
}
