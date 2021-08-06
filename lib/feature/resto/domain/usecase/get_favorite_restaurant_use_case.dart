import '../../../../core/usecase/usecase.dart';
import '../entity/restaurant/restaurant.dart';
import '../repository/restaurant_repository.dart';

class GetFavoriteRestaurantsUseCase implements UseCase<NoParams, List<Restaurant>> {
  final RestaurantRepository repository;

  GetFavoriteRestaurantsUseCase({required this.repository});

  @override
  Future<List<Restaurant>> invoke(NoParams params) async {
    return await repository.getFavoriteRestaurants();
  }
}
