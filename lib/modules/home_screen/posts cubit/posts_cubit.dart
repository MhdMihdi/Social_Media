import 'dart:io';

import 'package:bloc/bloc.dart';


import '../../../database/Services/posts_service.dart';
import '../../../database/models/home_models/home_model.dart';
import '../../../database/models/home_models/story_model.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitialState());

  getPosts(context) async {
    emit(PostsLoadingState());
    final response = await PostsService.getHomePagePosts();
    if (response is HomeModel) {
      emit(PostsLoadedState(posts: response));
    } else {
      emit(PostsErrorState(error: response));
    }
  }
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

  savePost({context, required String id}) async {
    emit(LikePostLoadingState());
    final response = await PostsService.savePost(id: id);
    if (response is bool) {
      emit(PostSavedState());
    } else {
      emit(PostsErrorState(error: response));
    }
  }
  reportPost({context, required String id}) async {
    emit(LikePostLoadingState());
    final response = await PostsService.reportPost(id: id);
    if (response is bool) {
      emit(PostReportedState());
    } else {
      emit(PostsErrorState(error: response));
    }
  }


  createPost(
      {context,
      String title = '',
      String content = '',
      List<File>? images,
      List<File>? videos,
      required String type}) async {
    emit(PostsLoadingState());
    final response = await PostsService.createPost(
        type: type,
        title: title,
        content: content,
        images: images,
        videos: videos);
    if (response is bool && response) {
      emit(PostUploadedState());
    } else {
      emit(PostsErrorState(error: response.toString()));
    }
  }
}
