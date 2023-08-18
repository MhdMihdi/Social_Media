import 'package:bloc/bloc.dart';
import 'package:dev_space/database/Services/user_service.dart';
import 'package:dev_space/database/models/Notifications_model/new_notificons_model.dart';
import 'package:dev_space/database/models/Notifications_model/old_notification_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitialState());
  static NotificationCubit get(context)=>BlocProvider.of(context);

  getOldNotifications(context) async {
    emit(OldNotificationLoadingState());
    final response = await UserService.getOldNotifications();
    if (response is OldNotifications ) {
      emit(OldNotificationLoadedState(noity: response));
    } else {
      emit(NotificationErrorState(error:response ));
    }
  }
  getNewNotifications(context) async {
    emit(NewNotificationLoadingState());
    final response = await UserService.getNewNotifications();
    if (response is NewNotifications ) {
      emit(NewNotificationLoadedState(noity: response));
    } else {
      emit(NotificationErrorState(error:response ));
    }
  }
}
