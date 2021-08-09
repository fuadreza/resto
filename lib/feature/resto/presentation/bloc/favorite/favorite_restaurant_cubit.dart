import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resto/core/usecase/usecase.dart';
import 'package:resto/feature/resto/domain/usecase/get_favorite_restaurant_use_case.dart';
import 'package:resto/feature/resto/presentation/bloc/favorite/favorite_restaurant_state.dart';

class FavoriteRestaurantCubit extends Cubit<FavoriteRestaurantState> {
  final GetFavoriteRestaurantsUseCase getFavoriteRestaurantsUseCase;

  FavoriteRestaurantCubit({required this.getFavoriteRestaurantsUseCase}) : super(Init());

  Future<void> getFavoriteRestaurants() async {
    emit(Loading());
    try {
      final restaurants = await getFavoriteRestaurantsUseCase.invoke(NoParams());
      if (restaurants.isNotEmpty) {
        emit(Loaded(restaurants: restaurants));
      } else {
        emit(Empty(message: 'You don\'t have favorite restaurant yet, Try adding them from detail page'));
      }
    } on Exception {
      emit(Error(message: 'Failed to load favorite restaurants'));
    }
  }
}
