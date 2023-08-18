part of 'notification_cubit.dart';

abstract class NotificationState {}

class NotificationInitialState extends NotificationState {}

class OldNotificationLoadingState extends NotificationState {}

class OldNotificationLoadedState extends NotificationState
{
  OldNotificationLoadedState({required this.noity});
  OldNotifications noity;
}

class NotificationErrorState extends NotificationState {
  NotificationErrorState({required this.error});
  String error;
}

class NewNotificationLoadingState extends NotificationState {}

class NewNotificationLoadedState extends NotificationState {
  NewNotificationLoadedState({required this.noity});
  NewNotifications noity;
}

