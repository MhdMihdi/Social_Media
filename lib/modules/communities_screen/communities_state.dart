part of 'communities_cubit.dart';


abstract class CommunitiesState {}

class CommunitiesInitialState extends CommunitiesState {}

class GetCommunitiesLoadingState extends CommunitiesState {}

class GetCommunitiesLoadedState extends CommunitiesState {
  GetCommunitiesLoadedState({required this.communities});
  GetCommuitesModel communities;
}

class CommunitiesErrorState extends CommunitiesState
{
  CommunitiesErrorState({required this.error});
  String error;
}

class CommunitiesDetailsLoadingState extends CommunitiesState {}

class CommunitiesDetailsLoadedState extends CommunitiesState {
  CommunitiesDetailsLoadedState({required this.communities});
  CommunitiesDetailsModel communities;
}

class PostSavedState extends CommunitiesState {}

class PostReportedState extends CommunitiesState {}

class PostAgrredState extends CommunitiesState {}

class LikePostLoadingState extends CommunitiesState {}

class LikePostDoneState extends CommunitiesState {
  LikePostDoneState({required this.liked});
  bool liked;
}

class LikePostErrorState extends CommunitiesState {
  LikePostErrorState({required this.error});
  String error;
}

class CommunitiesPostUploadedState extends CommunitiesState {}

class SharePostUploading extends CommunitiesState{}

class SharePostUploaded extends CommunitiesState{}