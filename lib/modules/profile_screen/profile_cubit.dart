import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dev_space/database/Services/user_service.dart';
import 'package:dev_space/database/models/profile_model/profile_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitialState());


  getProfileInfo(context)async
  {
    emit(ProfileLoadingState());
    final response=await UserService.getProfileInfo();
    if(response is ProfileModel){
      emit(ProfileLoadedState(profile:response));
    }else{
      emit(ProfileErrorState(error: response));
    }

  }

}
