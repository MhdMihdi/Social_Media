// ignore_for_file: camel_case_types, constant_identifier_names

import 'package:dev_space/database/Services/communities_service.dart';
import 'package:dev_space/database/Services/posts_service.dart';
import 'package:dev_space/database/models/communties_models/communties_detalis_model.dart';
import 'package:dev_space/database/models/communties_models/get_communties_model.dart';
import 'package:dev_space/modules/home_screen/posts%20cubit/posts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'communities_state.dart';

class CommunitiesCubit extends Cubit<CommunitiesState> {
  CommunitiesCubit() : super(CommunitiesInitialState());

  static CommunitiesCubit get(context)=>BlocProvider.of(context);

  getCommuites ()async
  {
    emit(GetCommunitiesLoadingState());
    var response =await CommunitiesService.getCommunities();
    if(response is GetCommuitesModel){
      emit(GetCommunitiesLoadedState(communities: response));
    }else{
      emit(CommunitiesErrorState(error: response));
    }
  }
  getCommunityDetails({required id,required type})async
  {
    emit(CommunitiesDetailsLoadingState());
    var response =await CommunitiesService.getCommunityDetails(id:id ,type:type);
    if(response is CommunitiesDetailsModel){
      emit(CommunitiesDetailsLoadedState(communities: response));
    }else{
      emit(CommunitiesErrorState(error: response));
    }
  }

  likePosts({context, required String id}) async {
    emit(LikePostLoadingState());
    final response = await CommunitiesService.likePost(id: id);
    if (response is bool) {
      emit(LikePostDoneState(liked: response));
    } else {
      emit(CommunitiesErrorState(error: response));
    }
  }

  dislikePosts({context, required String id}) async {
    emit(LikePostLoadingState());
    final response = await CommunitiesService.dislikePost(id: id);
    if (response is bool) {
      emit(LikePostDoneState(liked: response));
    } else {
      emit(CommunitiesErrorState(error: response));
    }
  }

  savePost({context, required String id}) async {
    emit(LikePostLoadingState());
    final response = await CommunitiesService.savePost(id: id);
    if (response is bool) {
      emit(PostSavedState());
    } else {
      emit(CommunitiesErrorState(error: response));
    }
  }
  reportPost({context, required String id}) async {
    emit(LikePostLoadingState());
    final response = await CommunitiesService.reportPost(id: id);
    if (response is bool) {
      emit(PostReportedState());
    } else {
      emit(CommunitiesErrorState(error: response));
    }
  }

  var contentController=TextEditingController();

  postType?type;

  sharePost({required context,required id,})async
  {
    emit(SharePostUploading());
    var response=await PostsService.sharePost(id: id.toString(), type: type!.name, content: contentController.text);
    if(response != null){
      emit(SharePostUploaded());
      Navigator.pop(context);
    }else{
      emit(CommunitiesErrorState(error: response));
    }
  }


}
