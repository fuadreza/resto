import 'package:resto/core/usecase/usecase.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/detail_restaurant.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/restaurant.dart';
import 'package:resto/feature/resto/domain/repository/restaurant_repository.dart';

class SetScheduleNotificationUseCase implements UseCase<bool, bool> {
  final RestaurantRepository repository;

  SetScheduleNotificationUseCase({required this.repository});

  @override
  Future<bool> invoke(bool params) async {
    return await repository.setScheduleNotification(params);
  }
}
