import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dev_space/database/Services/user_service.dart';
import 'package:meta/meta.dart';

import '../../../database/models/home_models/home_model.dart';
import '../../../database/models/home_models/story_model.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitialState());

  getPosts(context) async {
    emit(PostsLoadingState());
    final response = await UserService.getHomePagePosts();
    if (response is HomeModel) {
      emit(PostsLoadedState(posts: response));
    } else {
      emit(PostsErrorState(error: response));
    }
  }

  getActiveStories(context) async {
    emit(PostsLoadingState());
    final response = await UserService.getActiveStories();
    if (response is WelcomeStroies) {
      emit(StoriesLoadedState(stories: response));
    } else {
      emit(PostsErrorState(error: response));
    }
  }

  likePosts({context, required String id}) async {
    emit(LikePostLoadingState());
    final response = await UserService.likePost(id: id);
    if (response is bool) {
      emit(LikePostDoneState(liked: response));
    } else {
      emit(PostsErrorState(error: response));
    }
  }

  dislikePosts({context, required String id}) async {
    emit(LikePostLoadingState());
    final response = await UserService.dislikePost(id: id);
    if (response is bool) {
      emit(LikePostDoneState(liked: response));
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
    final response = await UserService.createPost(
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
