import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:resto/core/network/base_api_client.dart';
import 'package:resto/feature/resto/data/repository/restaurant_repository_impl.dart';
import 'package:resto/feature/resto/data/service/api/restaurant_service.dart';
import 'package:resto/feature/resto/data/service/background_service.dart';
import 'package:resto/feature/resto/data/service/database/dao/favorite_restaurant_dao.dart';
import 'package:resto/feature/resto/data/service/database/database_helper.dart';
import 'package:resto/feature/resto/data/source/local/restaurant_local_data_source.dart';
import 'package:resto/feature/resto/data/source/remote/restaurant_remote_data_source.dart';
import 'package:resto/feature/resto/domain/repository/restaurant_repository.dart';
import 'package:resto/feature/resto/domain/usecase/get_detail_restaurant_use_case.dart';
import 'package:resto/feature/resto/domain/usecase/get_favorite_restaurant_use_case.dart';
import 'package:resto/feature/resto/domain/usecase/get_restaurants_use_case.dart';
import 'package:resto/feature/resto/domain/usecase/remove_favorite_restaurant_use_case.dart';
import 'package:resto/feature/resto/domain/usecase/search_restaurant_use_case.dart';
import 'package:resto/feature/resto/domain/usecase/set_favorite_restaurant_use_case.dart';
import 'package:resto/feature/resto/domain/usecase/set_schedule_notification_use_case.dart';
import 'package:resto/feature/resto/presentation/bloc/detail/detail_restaurant_cubit.dart';
import 'package:resto/feature/resto/presentation/bloc/favorite/favorite_restaurant_cubit.dart';
import 'package:resto/feature/resto/presentation/bloc/restaurant/restaurant_cubit.dart';
import 'package:resto/feature/resto/presentation/bloc/search/search_restaurant_cubit.dart';
import 'package:resto/feature/resto/presentation/bloc/setting/setting_cubit.dart';

final di = GetIt.instance;

Future<void> init() async {
  //! Features - Restaurant
  // Bloc Cubit
  di.registerFactory(
    () => RestaurantCubit(
      getRestaurantsUseCase: di(),
    ),
  );
  di.registerFactory(
    () => DetailRestaurantCubit(
      getDetailRestaurantUseCase: di(),
      setFavoriteRestaurantUseCase: di(),
      removeFavoriteRestaurantUseCase: di(),
    ),
  );
  di.registerFactory(
    () => SearchRestaurantCubit(
      searchRestaurantUseCase: di(),
    ),
  );
  di.registerFactory(
    () => FavoriteRestaurantCubit(
      getFavoriteRestaurantsUseCase: di(),
    ),
  );
  di.registerFactory(
    () => SettingCubit(
      setScheduleNotificationUseCase: di(),
    ),
  );

  // Use cases
  di.registerLazySingleton(
    () => GetRestaurantsUseCase(
      repository: di(),
    ),
  );
  di.registerLazySingleton(
    () => GetDetailRestaurantUseCase(
      repository: di(),
    ),
  );
  di.registerLazySingleton(
    () => SearchRestaurantUseCase(
      repository: di(),
    ),
  );
  di.registerLazySingleton(
    () => GetFavoriteRestaurantsUseCase(
      repository: di(),
    ),
  );
  di.registerLazySingleton(
    () => SetFavoriteRestaurantUseCase(
      repository: di(),
    ),
  );
  di.registerLazySingleton(
    () => RemoveFavoriteRestaurantUseCase(
      repository: di(),
    ),
  );
  di.registerLazySingleton(
    () => SetScheduleNotificationUseCase(
      repository: di(),
    ),
  );

  // Repositories
  di.registerLazySingleton<RestaurantRepository>(
    () => RestaurantRepositoryImpl(
      localDataSource: di(),
      remoteDataSource: di(),
    ),
  );

  // Data sources
  // Local
  di.registerLazySingleton<RestaurantLocalDataSource>(
    () => RestaurantLocalDataSourceImpl(
      favoriteRestaurantDao: di(),
      backgroundService: di(),
    ),
  );

  // Remote
  di.registerLazySingleton<RestaurantRemoteDataSource>(
    () => RestaurantRemoteDataSourceImpl(
      restaurantService: di(),
    ),
  );

  // Service
  di.registerLazySingleton<RestaurantService>(
    () => RestaurantService(
      apiClient: di(),
    ),
  );

  // Dao
  di.registerLazySingleton<FavoriteRestaurantDao>(
    () => FavoriteRestaurantDao(
      databaseHelper: di(),
    ),
  );

  //! Core
  di.registerLazySingleton<BaseApiClient>(
    () => BaseApiClient(
      client: di(),
    ),
  );
  di.registerLazySingleton<DatabaseHelper>(
    () => DatabaseHelper(),
  );
  di.registerLazySingleton<BackgroundService>(
    () => BackgroundService(),
  );

  //! External
  di.registerLazySingleton(() => http.Client());
}
