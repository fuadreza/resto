import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resto/feature/resto/domain/usecase/search_restaurant_use_case.dart';
import 'package:resto/feature/resto/presentation/bloc/search/search_restaurant_state.dart';

class SearchRestaurantCubit extends Cubit<SearchRestaurantState> {
  final SearchRestaurantUseCase searchRestaurantUseCase;

  SearchRestaurantCubit({required this.searchRestaurantUseCase}) : super(Init());

  var text;

  Future<void> searchRestaurant(String keyword) async {
    emit(Loading());
    try {
      final restaurants = await searchRestaurantUseCase.invoke(keyword);
      if (restaurants.isNotEmpty) {
        emit(Loaded(restaurants: restaurants));
      } else {
        emit(Error(message: 'Cannot find any restaurant'));
      }
    } on Exception {
      emit(Error(message: 'Restaurant not found'));
    }
  }
}
