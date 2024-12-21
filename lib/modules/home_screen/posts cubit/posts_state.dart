part of 'posts_cubit.dart';

abstract class PostsState {}

class PostsInitialState extends PostsState {}

class PostsLoadingState extends PostsState {}

class PostsLoadedState extends PostsState {
  PostsLoadedState({required this.posts});
  HomeModel posts;
}
class StoriesLoadingState extends PostsState{}
class StoriesLoadedState extends PostsState {
  StoriesLoadedState({required this.stories});
  WelcomeStroies stories;
}

class PostUploadedState extends PostsState {}

class StoryUploadedState extends PostsState {}

class GetStoryLoadingState extends PostsState
{

}
class GetStoryLoadedState extends PostsState{
  GetStoryLoadedState({required this.model});
  HomeModel model;
}

class PostsErrorState extends PostsState {
  PostsErrorState({required this.error});
  String error;
}

class LikePostLoadingState extends PostsState {}

class PostSavedState extends PostsState {}

class PostReportedState extends PostsState {}
class PostAgrredState extends PostsState {}

class LikePostDoneState extends PostsState {
  LikePostDoneState({required this.liked});
  bool liked;
}

class LikePostErrorState extends PostsState {
  LikePostErrorState({required this.error});
  String error;
}

class SharePostUploading extends PostsState{}

class SharePostUploaded extends PostsState{}

class SelectPhotos extends PostsState{}
