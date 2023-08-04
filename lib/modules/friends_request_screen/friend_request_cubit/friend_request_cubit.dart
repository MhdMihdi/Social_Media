import 'package:bloc/bloc.dart';
import 'package:dev_space/database/Services/friend_request_service.dart';
import 'package:meta/meta.dart';

import '../../../database/models/friend_request_model/friend_request_model.dart';
part 'friend_request_state.dart';

class FriendRequestCubit extends Cubit<FriendRequestState> {
  FriendRequestCubit() : super(FriendRequestInitialState());

  getFriendRequests(context) async {
    emit(FriendRequestLoadingState());
    final response = await FriendRequestService.getFriendRequests();
    if (response is WelcomeFriendRequest) {
      emit(FriendRequestLoadedState(requests: response));
    } else {
      emit(FriendRequestErrorState(error: response));
    }
  }

  AcceptOrRejectOrCancelFriendRequest(
      {context, required String id, required bool? isAccept}) async {
    final response =
        await FriendRequestService.AcceptOrRejectOrCancelFriendRequest(
            id: id, isAccept: isAccept);
    if (response is bool && response) {
      emit(FriendRequestAcceptedOrRejectedState());
    } else {
      emit(FriendRequestErrorState(error: response));
    }
  }



}
