part of 'auth_cubit.dart';


abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthSelectPhotoState extends AuthState {}

class AuthIsPasswordState extends AuthState {}

class AuthSelectGenderState extends AuthState {}

class AuthViewSignUpState extends AuthState {}

class AuthSelectSpecialtyState extends AuthState {}

class AuthSelectOptionState extends AuthState {}

class AuthSelectLanState extends AuthState {}

class AuthSelectFrameState extends AuthState {}

class AuthSelectState extends AuthState {}

class AuthSelectCollegeState extends AuthState {}

class AuthSignUpLoadingState extends AuthState {}

class AuthSignUpSuccessState extends AuthState {}

class AuthSignUpDoneState extends AuthState {}

class AuthLoginLoadingState extends AuthState {}

class AuthLoginSuccessState extends AuthState {}

class AuthLoginDoneState extends AuthState {}