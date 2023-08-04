import 'package:bloc/bloc.dart';
import 'package:dev_space/database/Services/user_service.dart';
import 'package:meta/meta.dart';
part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitialState());
  getNotifications(context) async {
    emit(NotificationLoadingState());
    final response = await UserService.getNotifications();
    if (response is List) {
      emit(NotificationLoadedState());
    } else {
      emit(NotificationErrorState());
    }
  }
}
