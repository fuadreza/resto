import 'package:resto/core/usecase/usecase.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/detail_restaurant.dart';
import 'package:resto/feature/resto/domain/repository/restaurant_repository.dart';

class SetFavoriteRestaurantUseCase implements UseCase<DetailRestaurant, String> {
  final RestaurantRepository repository;

  SetFavoriteRestaurantUseCase({required this.repository});

  @override
  Future<String> invoke(DetailRestaurant params) async {
    return await repository.setFavoriteRestaurant(params);
  }
}
