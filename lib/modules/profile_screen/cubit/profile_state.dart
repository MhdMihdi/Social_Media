part of 'profile_cubit.dart';


abstract class ProfileState {}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadedState extends ProfileState {
  ProfileLoadedState({required this.profile});
  ProfileModel profile;
}
class ProfileErrorState extends ProfileState {
  ProfileErrorState({required this.error});
  String error;
}

class ProfilePostsLoadingState extends ProfileState {}

class ProfilePostsLoadedState extends ProfileState {
  ProfilePostsLoadedState({required this.posts});
  HomeModel posts;
}
class ProfilePostsErrorState extends ProfileState {
  ProfilePostsErrorState({required this.error});
  String error;
}
class LikePostLoadingState extends ProfileState {}

class PostSavedState extends ProfileState {}

class PostReportedState extends ProfileState {}

class LikePostDoneState extends ProfileState {
  LikePostDoneState({required this.liked});
  bool liked;
}

class LikePostErrorState extends ProfileState {
  LikePostErrorState({required this.error});
  String error;
}



class ProfileSelectPhoto extends ProfileState{}

class ProfileUpdateInfoLoadingPhoto extends ProfileState{}

class ProfileUpdateInfoSuccessPhoto extends ProfileState{}

class ProfileUpdateInfoDonePhoto extends ProfileState{}




