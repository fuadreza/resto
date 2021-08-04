import 'package:get_it/get_it.dart';
import 'package:resto/feature/resto/data/repository/restaurant_repository_impl.dart';
import 'package:resto/feature/resto/data/source/local/restaurant_local_data_source.dart';
import 'package:resto/feature/resto/domain/repository/restaurant_repository.dart';
import 'package:resto/feature/resto/domain/usecase/get_restaurants_use_case.dart';
import 'package:resto/feature/resto/presentation/bloc/restaurant_cubit.dart';

final di = GetIt.instance;

Future<void> init() async {
  //! Features - Restaurant
  // Bloc Cubit
  di.registerFactory(
    () => RestaurantCubit(
      getRestaurantsUseCase: di(),
    ),
  );

  // Use cases
  di.registerLazySingleton(
    () => GetRestaurantsUseCase(
      repository: di(),
    ),
  );

  // Repositories
  di.registerLazySingleton<RestaurantRepository>(
    () => RestaurantRepositoryImpl(
      localDataSource: di(),
    ),
  );

  // Data sources
  di.registerLazySingleton<RestaurantLocalDataSource>(
    () => RestaurantLocalDataSourceImpl(),
  );
}
