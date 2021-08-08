import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/detail_restaurant.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/restaurant.dart';
import 'package:resto/feature/resto/domain/usecase/get_detail_restaurant_use_case.dart';
import 'package:resto/feature/resto/domain/usecase/remove_favorite_restaurant_use_case.dart';
import 'package:resto/feature/resto/domain/usecase/set_favorite_restaurant_use_case.dart';
import 'package:resto/feature/resto/presentation/bloc/detail/detail_restaurant_state.dart';

class DetailRestaurantCubit extends Cubit<DetailRestaurantState> {
  final GetDetailRestaurantUseCase getDetailRestaurantUseCase;
  final SetFavoriteRestaurantUseCase setFavoriteRestaurantUseCase;
  final RemoveFavoriteRestaurantUseCase removeFavoriteRestaurantUseCase;

  DetailRestaurantCubit({
    required this.getDetailRestaurantUseCase,
    required this.setFavoriteRestaurantUseCase,
    required this.removeFavoriteRestaurantUseCase,
  }) : super(Init());

  Future<void> getDetailRestaurant(String restaurantId) async {
    emit(Loading());
    try {
      final detailRestaurant = await getDetailRestaurantUseCase.invoke(restaurantId);
      emit(Loaded(detailRestaurant: detailRestaurant));
    } on Exception {
      emit(Error(message: 'Failed load detail restaurant'));
    }
  }

  Future<void> setFavoriteRestaurant(DetailRestaurant restaurant) async {
    try {
      final _ = await setFavoriteRestaurantUseCase.invoke(
        Restaurant(
          id: restaurant.id,
          name: restaurant.name,
          pictureId: restaurant.pictureId,
          city: restaurant.city,
          rating: restaurant.rating,
        ),
      );
    } on Exception {
      throw Exception;
    }
  }
}
