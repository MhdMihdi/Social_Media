import 'package:bloc/bloc.dart';
import 'package:dev_space/database/Services/user_service.dart';
import 'package:meta/meta.dart';

import '../../../database/models/home_models/home_model.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitialState());

  getPosts(context)async{
    emit(PostsLoadingState());
    final response =await UserService.getHomePagePosts();
    if(response is HomeModel){
      emit(PostsLoadedState(posts: response));
    }
    else{
      emit(PostsErrorState(error:response));
    }
  }
}
