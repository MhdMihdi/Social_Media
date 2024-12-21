// ignore_for_file: camel_case_types, constant_identifier_names

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';


import '../../../database/Services/posts_service.dart';
import '../../../database/models/home_models/home_model.dart';
import '../../../database/models/home_models/story_model.dart';

part 'posts_state.dart';
enum postType {
  Regular,
  Cv,
  JobOpportunity,
  Question,
  Challenge,
  RoadMap,
  Advice,
}
class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitialState());

  static PostsCubit get(context)=>BlocProvider.of(context);

  getPosts(context) async {
    emit(PostsLoadingState());
    final response = await PostsService.getHomePagePosts();
    if (response is HomeModel) {
      emit(PostsLoadedState(posts: response));
    } else {
      emit(PostsErrorState(error: response));
    }
  }
  // getProfilePosts(context) async {
  //   emit(PostsLoadingState());
  //   final response = await PostsService.getProfilePosts();
  //   if (response is HomeModel) {
  //     emit(PostsLoadedState(posts: response));
  //   } else {
  //     emit(PostsErrorState(error: response));
  //   }
  // }
  getMyPosts(context) async {
    emit(PostsLoadingState());
    final response = await PostsService.getMyPosts();
    if (response is HomeModel) {
      emit(PostsLoadedState(posts: response));
    } else {
      emit(PostsErrorState(error: response));
    }
  }

  getActiveStories(context) async {
    emit(PostsLoadingState());
    final response = await PostsService.getActiveStories();
    if (response is WelcomeStroies) {
      emit(StoriesLoadedState(stories: response));
    } else {
      emit(PostsErrorState(error: response));
    }
  }

  likePosts({context, required String id}) async {
    emit(LikePostLoadingState());
    final response = await PostsService.likePost(id: id);
    if (response is bool) {
      emit(LikePostDoneState(liked: response));
    } else {
      emit(PostsErrorState(error: response));
    }
  }

  dislikePosts({context, required String id}) async {
    emit(LikePostLoadingState());
    final response = await PostsService.dislikePost(id: id);
    if (response is bool) {
      emit(LikePostDoneState(liked: response));
    } else {
      emit(PostsErrorState(error: response));
    }
  }
  bool?isSave;
  savePost({context, required String id}) async {
    emit(LikePostLoadingState());
    final response = await PostsService.savePost(id: id);
    if (response is bool) {
      if(response==true){
        isSave=true;
      }else{
        isSave=false;
      }
      emit(PostSavedState());

    } else {
      emit(PostsErrorState(error: response));
    }
  }
  bool?isReported;
  reportPost({context, required String id}) async {
    emit(LikePostLoadingState());
    final response = await PostsService.reportPost(id: id);
    if (response is bool) {
      if(response==true){
        isReported==true;
      }else{
        isReported==false;
      }
      emit(PostReportedState());

    } else {
      emit(PostsErrorState(error: response));
    }
  }
  agreePost({context, required String id}) async {
    emit(LikePostLoadingState());
    final response = await PostsService.agreePost(id: id);
    if (response is bool) {
      emit(PostAgrredState());
    } else {
      emit(PostsErrorState(error: response));
    }
  }

  var selectedtype ;
  //List<XFile>imageFile=[];
  final ImagePicker imagepicker = ImagePicker();


  List<XFile> videos = []; // List of selected images

  var contetPController=TextEditingController();


  createPost({required context,required images}) async {
    emit(PostsLoadingState());
    final response = await PostsService.createPost(
        type: selectedtype.toString(),
        title: '',
        content: contetPController.text,
        images: images,
        videos: videos
    );
    if (response != null ) {
      emit(PostUploadedState());
      Navigator.pop(context);
      //emit(PostsLoadingState());
    } else {
      emit(PostsErrorState(error: response.toString()));
    }
  }
  createStory({required context,required images,required content}) async {
    emit(PostsLoadingState());
    final response = await PostsService.createStory(
        type: 'Story',
        title: '',
        content: content,
        images: images,
        videos: videos
    );
    if (response != null ) {
      emit(StoryUploadedState());
      Navigator.pop(context);
      //emit(PostsLoadingState());
    } else {
      emit(PostsErrorState(error: response.toString()));
    }
  }
  getStory({required context,required id}) async {
    emit(GetStoryLoadingState());
    final response = await PostsService.getStory(id: id.toString());
    if (response  is HomeModel ) {
      emit(GetStoryLoadedState(model: response));

      //emit(PostsLoadingState());
    } else {
      emit(PostsErrorState(error: response.toString()));
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
      emit(PostsErrorState(error: response));
    }
  }
}

