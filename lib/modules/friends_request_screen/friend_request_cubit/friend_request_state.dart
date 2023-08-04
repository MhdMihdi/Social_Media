part of 'friend_request_cubit.dart';

abstract class FriendRequestState {}

class FriendRequestInitialState extends FriendRequestState {}

class FriendRequestLoadingState extends FriendRequestState {}

class FriendRequestAcceptedOrRejectedState extends FriendRequestState {}

class FriendRequestLoadedState extends FriendRequestState {
  FriendRequestLoadedState({required this.requests});
  WelcomeFriendRequest requests;
}

class FriendRequestErrorState extends FriendRequestState {
  FriendRequestErrorState({required this.error});
  String error;
}
