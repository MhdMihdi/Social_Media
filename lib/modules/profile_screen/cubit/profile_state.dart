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
class ProfileSelectPhoto extends ProfileState{}

class ProfileUpdateInfoLoadingPhoto extends ProfileState{}

class ProfileUpdateInfoSuccessPhoto extends ProfileState{}

class ProfileUpdateInfoDonePhoto extends ProfileState{}

class ProfilePostsLoadingState extends ProfileState{

}

class ProfilePostsLoadedState extends ProfileState{
  ProfilePostsLoadedState({required this.posts});
  HomeModel posts;
}

class ProfilePostsErrorState extends ProfileState{
  ProfilePostsErrorState({required this.error});
  String error;
}
class ProfilePostSavedState extends ProfileState {}

class ProfilePostReportedState extends ProfileState {}

class ProfileLikePostDoneState extends ProfileState {
  ProfileLikePostDoneState({required this.liked});
  bool liked;
}

class ProfileLikePostLoadingState extends ProfileState {}

class ProfileLikePostErrorState extends ProfileState {
  ProfileLikePostErrorState({required this.error});
  String error;
}
