part of 'comment_cubit.dart';


abstract class CommentState {}

class CommentInitialState extends CommentState {}

class CommentLoadingState extends CommentState {}

class CommentUploadingState extends CommentState{}

class CommentUploadedState extends CommentState{}

class CommentLoadedState extends CommentState {
  CommentLoadedState({required this.comments});
  CommentModel comments;
}

class CommentErrorState extends CommentState {
  CommentErrorState({required this.error});
  String error;
}

class LikeCommentLoadingState extends CommentState {}

class CommentReportedState extends CommentState {}

class LikeCommentDoneState extends CommentState {
  LikeCommentDoneState({required this.liked});
  bool liked;
}

class LikeCommentErrorState extends CommentState {
  LikeCommentErrorState({required this.error});
  String error;
}

