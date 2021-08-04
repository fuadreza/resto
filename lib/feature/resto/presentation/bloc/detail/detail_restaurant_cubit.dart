import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resto/feature/resto/domain/usecase/get_detail_restaurant_use_case.dart';
import 'package:resto/feature/resto/presentation/bloc/detail/detail_restaurant_state.dart';

class DetailRestaurantCubit extends Cubit<DetailRestaurantState> {
  final GetDetailRestaurantUseCase getDetailRestaurantUseCase;

  DetailRestaurantCubit({required this.getDetailRestaurantUseCase}) : super(Init());

  Future<void> getDetailRestaurant(String restaurantId) async {
    emit(Loading());
    try {
      final detailRestaurant = await getDetailRestaurantUseCase.invoke(restaurantId);
      emit(Loaded(detailRestaurant: detailRestaurant));
    } on Exception {
      emit(Error(message: 'Failed load detail restaurant'));
    }
  }
}
