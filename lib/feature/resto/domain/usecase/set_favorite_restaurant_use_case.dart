import 'package:resto/core/usecase/usecase.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/detail_restaurant.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/restaurant.dart';
import 'package:resto/feature/resto/domain/repository/restaurant_repository.dart';

class SetFavoriteRestaurantUseCase implements UseCase<Restaurant, String> {
  final RestaurantRepository repository;

  SetFavoriteRestaurantUseCase({required this.repository});

  @override
  Future<String> invoke(Restaurant params) async {
    return await repository.setFavoriteRestaurant(params);
  }
}
