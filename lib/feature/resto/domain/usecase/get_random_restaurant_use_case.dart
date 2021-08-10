import 'package:resto/core/usecase/usecase.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/restaurant.dart';
import 'package:resto/feature/resto/domain/repository/restaurant_repository.dart';

class GetRandomRestaurantUseCase implements UseCase<NoParams, Restaurant> {
  final RestaurantRepository repository;

  GetRandomRestaurantUseCase({required this.repository});

  @override
  Future<Restaurant> invoke(NoParams params) async {
    return await repository.getRandomRestaurant();
  }
}
