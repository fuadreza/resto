import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resto/core/usecase/usecase.dart';
import 'package:resto/feature/resto/domain/usecase/get_restaurants_use_case.dart';
import 'package:resto/feature/resto/presentation/bloc/restaurant_state.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  final GetRestaurantsUseCase getRestaurantsUseCase;

  RestaurantCubit({required this.getRestaurantsUseCase}) : super(Init());

  Future<void> getRestaurants() async {
    emit(Loading());
    final restaurants = await getRestaurantsUseCase.invoke(NoParams());
    emit(Loaded(restaurants: restaurants));
  }
}
