import 'package:bloc/bloc.dart';
import 'package:dev_space/database/Services/search_service.dart';
import 'package:dev_space/database/models/searh_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  static SearchCubit get(context)=>BlocProvider.of(context);
  var controller = TextEditingController();

  getSearch({required search})async{
   emit(SearchLoading());
   var response=await SearchService.search(search: search);
   if(response is SearchModel){
     emit(SearchLoaded(model: response));
   }else{
     emit(SearchError(error: response));
   }
  }
}
