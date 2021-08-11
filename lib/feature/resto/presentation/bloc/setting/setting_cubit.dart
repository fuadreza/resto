import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resto/feature/resto/domain/usecase/set_schedule_notification_use_case.dart';
import 'package:resto/feature/resto/presentation/bloc/setting/setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  final SetScheduleNotificationUseCase setScheduleNotificationUseCase;

  SettingCubit({
    required this.setScheduleNotificationUseCase,
  }) : super(Init());

  Future<void> setScheduleNotification(bool state) async {
    try {
      await setScheduleNotificationUseCase.invoke(state);
    } on Exception catch (e) {
      print('Error $e');
    }
  }
}
