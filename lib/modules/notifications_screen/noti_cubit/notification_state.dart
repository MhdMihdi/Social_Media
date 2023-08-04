part of 'notification_cubit.dart';

abstract class NotificationState {}

class NotificationInitialState extends NotificationState {}

class NotificationLoadingState extends NotificationState {}

class NotificationLoadedState extends NotificationState {}

class NotificationErrorState extends NotificationState {}
