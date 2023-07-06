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

class AuthForgotPasswordLoadingState extends AuthState {}

class AuthForgotPasswordSuccessState extends AuthState {}

class AuthForgotPasswordDoneState extends AuthState {}

class AuthCheckCodeLoadingState extends AuthState {}

class AuthCheckCodeSuccessState extends AuthState {}

class AuthCheckCodeDoneState extends AuthState {}

class AuthResetPassLoadingState extends AuthState {}

class AuthResetPassSuccessState extends AuthState {}

class AuthResetPassDoneState extends AuthState {}

class AuthCompleteInfoLoadingState extends AuthState {}

class AuthCompleteInfoSuccessState extends AuthState {}

class AuthCompleteInfoDoneState extends AuthState {}