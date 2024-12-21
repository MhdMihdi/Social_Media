import 'package:dev_space/layout/dev_layout.dart';
import 'package:dev_space/modules/auth/complete_information/complete_information.dart';
import 'package:dev_space/modules/auth/log_in/forget_password/enter_email.dart';
import 'package:dev_space/modules/auth/log_in/forget_password/reset_password.dart';
import 'package:dev_space/modules/auth/log_in/log_in_screen.dart';
import 'package:dev_space/modules/auth/log_in/forget_password/email_verifiction.dart';
import 'package:dev_space/modules/auth/sign_up/sign_up_screen1.dart';
import 'package:dev_space/modules/auth/sign_up/sign_up_screen2.dart';
import 'package:dev_space/modules/auth/welcome/welcome_screen.dart';
import 'package:dev_space/modules/comment_screen/comment_screen.dart';
import 'package:dev_space/modules/communities_screen/communities_sceen.dart';
import 'package:dev_space/modules/drawer/createPage.dart';
import 'package:dev_space/modules/friends_request_screen/friends_request_screen.dart';
import 'package:dev_space/modules/communities_screen/create_com_post.dart';
import 'package:dev_space/modules/home_screen/create_post.dart';
import 'package:dev_space/modules/home_screen/home_screen.dart';
import 'package:dev_space/modules/home_screen/sotry_view_screen.dart';
import 'package:dev_space/modules/home_screen/story_add_screen.dart';
import 'package:dev_space/modules/notifications_screen/notifications_screen.dart';
import 'package:dev_space/modules/profile_screen/edit_profile_screen.dart';
import 'package:dev_space/modules/profile_screen/profile_screen.dart';
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
   static const homeScreen= 'homeScreen';
   static const friendRequestScreen= 'friendRequestScreen';
   static const communitiesScreen= 'communitiesScreen';
   static const profileScreen= 'profileScreen';
   static const notificationScreen= 'notificationScreen';
   static const storyViewScreen= 'storyViewScreen';
   static const storyAddScreen= 'storyAddScreen';
   static const editProfileScreen= 'EditProfileScreen';
   static const commentScreen= 'CommentScreen';
   static const createPostScreen= 'createPostScreen';
   static const createPostComScreen= 'createPostComScreen';
   static const createPageScreen= 'createPageScreen';

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
  static const homeScreen= HomeScreen();
  static const friendRequestScreen= FriendRequestScreen();
  static const communitiesScreen= CommunitiesScreen();
  static const profileScreen= ProfileScreen();
  static const notificationScreen= NotificationsScreen();
  static var  storyViewScreen= StoryViewScreen();
  static const storyAddScreen= StoryAddScreen();
  static const editProfileScreen= EditProfileScreen();
  static const commentScreen= CommentScreen();
  static const createPostScreen= CreatePost();
  static const createPostComScreen= CreateComPost();
  static var createPageScreen= CreatePage();




 
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
     NamedRoutes.homeScreen:(context)=>AppRoutes.homeScreen,
     NamedRoutes.friendRequestScreen:(context)=>AppRoutes.friendRequestScreen,
     NamedRoutes.communitiesScreen:(context)=>AppRoutes.communitiesScreen,
     NamedRoutes.profileScreen:(context)=>AppRoutes.profileScreen,
     NamedRoutes.notificationScreen:(context)=>AppRoutes.notificationScreen,
     NamedRoutes.storyViewScreen:(context)=>AppRoutes.storyViewScreen,
     NamedRoutes.storyAddScreen:(context)=>AppRoutes.storyAddScreen,
     NamedRoutes.editProfileScreen:(context)=>AppRoutes.editProfileScreen,
     NamedRoutes.commentScreen:(context)=>AppRoutes.commentScreen,
     NamedRoutes.createPostScreen:(context)=>AppRoutes.createPostScreen,
     NamedRoutes.createPageScreen:(context)=>AppRoutes.createPageScreen,
     NamedRoutes.createPostComScreen:(context)=>AppRoutes.createPostComScreen,


  };
}

