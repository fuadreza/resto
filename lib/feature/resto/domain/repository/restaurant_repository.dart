import 'package:resto/feature/resto/domain/entity/restaurant/detail_restaurant.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/restaurant.dart';

abstract class RestaurantRepository {
  Future<List<Restaurant>> getRestaurants();

  Future<DetailRestaurant> getDetailRestaurant(String restaurantId);

  Future<List<Restaurant>> searchRestaurant(String keyword);

  Future<List<Restaurant>> getFavoriteRestaurants();

//Future<List<Restaurant>> setFavoriteRestaurants(DetailRestaurant restaurant);
}
