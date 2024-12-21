import 'package:bloc/bloc.dart';
import 'package:dev_space/database/models/searh_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  static SearchCubit get(context)=>BlocProvider.of(context);
  var controller = TextEditingController();

  getSearch({required search}){
   emit(state)
  }
}
