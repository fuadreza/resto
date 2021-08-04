import 'package:resto/core/usecase/usecase.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/detail_restaurant.dart';
import 'package:resto/feature/resto/domain/repository/restaurant_repository.dart';

class GetDetailRestaurantUseCase implements UseCase<String, DetailRestaurant> {
  final RestaurantRepository repository;

  GetDetailRestaurantUseCase({required this.repository});

  @override
  Future<DetailRestaurant> invoke(String params) async {
    return await repository.getDetailRestaurant(params);
  }
}
