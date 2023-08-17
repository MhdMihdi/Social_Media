import 'package:dev_space/database/Services/posts_service.dart';
import 'package:dev_space/database/models/comment_model/comment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit() : super(CommentInitialState());

  static CommentCubit get(context)=>BlocProvider.of(context);

  var contentController=TextEditingController();

  getComments({required context,required postId}) async {
    emit(CommentLoadingState());
    final response = await PostsService.getComment(postId: postId);
    if (response is CommentModel) {
      emit(CommentLoadedState(comments: response));
    } else {
      //print('sssss');
      emit(CommentErrorState(error: response));
    }
  }
  likeComment({required context, required String commentId}) async {
    emit(LikeCommentLoadingState());
    final response = await PostsService.likeComment(commentId: commentId);
    if (response is bool) {
      emit(LikeCommentDoneState(liked: response));
    } else {
      emit(CommentErrorState(error: response));
    }
  }

  dislikeComment({required context, required String commentId}) async {
    emit(LikeCommentLoadingState());
    final response = await PostsService.dislikeComment(commentId: commentId);
    if (response is bool) {
      emit(LikeCommentDoneState(liked: response));
    } else {
      emit(CommentErrorState(error: response));
    }
  }
  reportComment({required context, required String commentId}) async {
    emit(LikeCommentLoadingState());
    final response = await PostsService.reportComment(commentId: commentId);
    if (response is bool) {
      emit(CommentReportedState());
    } else {
      emit(CommentErrorState(error: response));
    }
  }
  createComment({required context,required id})async
  {
   emit(CommentUploadingState());
   final response=await PostsService.createComment(content: contentController.text, id: id);
   if(response != null){
     emit(CommentUploadedState());
     contentController.clear();
     emit(CommentLoadingState());
   }else{
     emit(CommentErrorState(error: response.toString()));
   }
  }
}
