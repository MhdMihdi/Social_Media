import 'package:dev_space/shared/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'dev_state.dart';


class DevCubit extends Cubit<DevState>
{
  DevCubit() : super(DevInitialState());

  static DevCubit get(context) => BlocProvider.of(context);

  int currentIndex=0;

  List<Widget>screens=
  [
    AppRoutes.homeScreen,
    AppRoutes.friendRequestScreen,
    AppRoutes.communitiesScreen,
    AppRoutes.profileScreen,
    AppRoutes.notificationScreen,
  ];

  void toggleIndex(index){
    currentIndex=index;
    emit(DevToggleBottomNavBarState());
  }

}
