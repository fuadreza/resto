
import 'package:resto/core/usecase/usecase.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/restaurant.dart';
import 'package:resto/feature/resto/domain/repository/restaurant_repository.dart';

class SearchRestaurantUseCase implements UseCase<String, List<Restaurant>> {
  final RestaurantRepository repository;

  SearchRestaurantUseCase({required this.repository});

  @override
  Future<List<Restaurant>> invoke(String params) async {
    return await repository.searchRestaurant(params);
  }
}