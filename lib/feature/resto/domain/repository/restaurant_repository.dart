import 'package:resto/feature/resto/domain/entity/restaurant/restaurant.dart';

abstract class RestaurantRepository {
  Future<List<Restaurant>> getRestaurants();
}
