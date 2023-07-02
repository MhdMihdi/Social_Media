import 'package:dev_space/layout/dev_layout.dart';
import 'package:dev_space/modules/auth/complete_information/complete_information.dart';
import 'package:dev_space/modules/auth/log_in/forget_password/enter_email.dart';
import 'package:dev_space/modules/auth/log_in/forget_password/reset_password.dart';
import 'package:dev_space/modules/auth/log_in/log_in_screen.dart';
import 'package:dev_space/modules/auth/log_in/forget_password/email_verifiction.dart';
import 'package:dev_space/modules/auth/sign_up/sign_up_screen1.dart';
import 'package:dev_space/modules/auth/sign_up/sign_up_screen2.dart';
import 'package:dev_space/modules/auth/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

class NamedRoutes
{
   static const welcome='welcome';
   static const login='login';
   static const signIn1='signIn1';
   static const signIn2='signIn2';
   static const resetPass='emailEnter';
   static const emailVerify='emailVerify';
   static const completeInfo= 'completeInfo';
   static const homePage= 'homePage';
   static const newPass= 'resetPassword';

}

class AppRoutes
{
  static const welcome=WelcomeScreen();
  static const login=LogInScreen();
  static const signIn1=SignUpScreen1();
  static const signIn2=SignUpScreen2();
  static const resetPass=EnterEmail();
  static const emailVerify=EmailVerification();
  static const completeInfo=CompleteInformation();
  static const homePage=DevLayout();
  static const newPass=ResetPassword();

 
  static Map <String,Widget Function(BuildContext context)>routes=
  {
     NamedRoutes.welcome:(context)=>AppRoutes.welcome,
     NamedRoutes.login:(context)=>AppRoutes.login,
     NamedRoutes.signIn1:(context)=>AppRoutes.signIn1,
     NamedRoutes.signIn2:(context)=>AppRoutes.signIn2,
     NamedRoutes.resetPass:(context)=>AppRoutes.resetPass,
     NamedRoutes.emailVerify:(context)=>AppRoutes.emailVerify,
     NamedRoutes.completeInfo:(context)=>AppRoutes.completeInfo,
     NamedRoutes.homePage:(context)=>AppRoutes.homePage,
     NamedRoutes.newPass:(context)=>AppRoutes.newPass,


  };
}

