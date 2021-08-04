
import 'package:resto/core/usecase/usecase.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/restaurant.dart';
import 'package:resto/feature/resto/domain/repository/restaurant_repository.dart';

class GetRestaurantsUseCase implements UseCase<NoParams, List<Restaurant>> {
  final RestaurantRepository repository;

  GetRestaurantsUseCase({required this.repository});

  @override
  Future<List<Restaurant>> invoke(NoParams params) async{
    return await repository.getRestaurants();
  }
}