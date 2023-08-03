part of 'posts_cubit.dart';

abstract class PostsState {}

class PostsInitialState extends PostsState {}

class PostsLoadingState extends PostsState {}

class PostsLoadedState extends PostsState {
  PostsLoadedState({required this.posts});
  HomeModel posts;
}

class PostsErrorState extends PostsState {
  PostsErrorState({required this.error});
  String error;
}


class LikePostLoadingState extends PostsState {}

class LikePostDoneState extends PostsState {
  LikePostDoneState({required this.liked});
  bool liked;
}

class LikePostErrorState extends PostsState {
  LikePostErrorState({required this.error});
  String error;
}
