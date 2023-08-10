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
