part of 'search_cubit.dart';


abstract class SearchState {}

class SearchInitial extends SearchState {

}
class SearchLoading extends SearchState {}
class SearchLoaded extends SearchState {
  SearchLoaded({required this.model});
  SearchModel model;
}
class SearchError extends SearchState {
  SearchError({required this.error});
  String error;
}
