import 'dart:convert';
import 'package:dev_space/database/Services/user_service.dart';
import 'package:dev_space/database/models/home_models/home_model.dart';
import 'package:dev_space/shared/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../database/Services/posts_service.dart';
part 'dev_state.dart';

class DevCubit extends Cubit<DevState> {
  DevCubit() : super(DevInitialState());

  static DevCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    AppRoutes.homeScreen,
    AppRoutes.friendRequestScreen,
    AppRoutes.communitiesScreen,
    AppRoutes.profileScreen,
    AppRoutes.notificationScreen,
  ];

  void toggleIndex(index) {
    currentIndex = index;
    emit(DevToggleBottomNavBarState());
  }

  HomeModel? homeModel;

  void getHomeData() {
    emit(DevHomePostsLoadingState());
    PostsService.getHomePagePosts().then((value) {
      homeModel = HomeModel.fromJson(jsonDecode(value.body));
      debugPrint(homeModel?.message);
      debugPrint(homeModel!.data.posts[0][0]);
      emit(DevHomePostsSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(DevHomePostsErrorState());
    });
  }
}
