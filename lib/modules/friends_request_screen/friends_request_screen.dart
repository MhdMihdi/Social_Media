import 'package:dev_space/modules/friends_request_screen/friend_request_cubit/friend_request_cubit.dart';
import 'package:dev_space/shared/components/components.dart';
import 'package:dev_space/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class FriendRequestScreen extends StatelessWidget {
  const FriendRequestScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var getHeight = MediaQuery.of(context).size.height;
    var getWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.color,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        title: const Text(
          'Friend Requests',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: Colors.white,
            iconSize: 30,
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => FriendRequestCubit()..getFriendRequests(context),
        child: BlocConsumer<FriendRequestCubit, FriendRequestState>(
            listener: (context, state) {
              if(state is FriendRequestAcceptedOrRejectedState)
                {
                  context.read<FriendRequestCubit>().getFriendRequests(context);
                }
          // if (state is FriendRequestErrorState) {
          //   showScaffoldSnackBar(title: state.error, context: context);
          // }
        }, builder: (context, state) {
          if (state is FriendRequestLoadedState) {
            return ListView.builder(
                itemCount: state.requests.requests.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: getHeight * .1,
                        child: MaterialButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: 30,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    '${state.requests.requests[index].firstName} ${state.requests.requests[index].lastName}',
                                    style: const TextStyle(
                                      color: Constants.color,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: getWidth * .18,
                                        height: getHeight * .04,
                                        decoration: BoxDecoration(
                                          color: Constants.color,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: MaterialButton(
                                          onPressed: () {
                                            context
                                                .read<FriendRequestCubit>()
                                                .AcceptOrRejectOrCancelFriendRequest(
                                                    id: state.requests
                                                        .requests[index].id
                                                        .toString(),
                                                    isAccept: true);
                                          },
                                          child: const Text(
                                            'Confirm',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: getWidth * .18,
                                        height: getHeight * .04,
                                        decoration: BoxDecoration(
                                          color: Constants.color,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: MaterialButton(
                                          onPressed: () {
                                            context
                                                .read<FriendRequestCubit>()
                                                .AcceptOrRejectOrCancelFriendRequest(
                                                id: state.requests
                                                    .requests[index].id
                                                    .toString(),
                                                isAccept: false);
                                          },
                                          child: const Text(
                                            'Delete',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: getWidth * .08,
                              ),
                              IconButton(
                                  onPressed: () {
                                    context
                                        .read<FriendRequestCubit>()
                                        .AcceptOrRejectOrCancelFriendRequest(
                                        id: state.requests
                                            .requests[index].id
                                            .toString(),
                                        isAccept: null);
                                  },
                                  icon: const Icon(Icons.close))
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: 10,
                        color: Colors.deepPurple.withOpacity(.2),
                      )
                    ],
                  );
                });
          }
          if (state is FriendRequestLoadingState) {
            return ListView.builder(
                itemCount:6,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 9),
                      color: Colors.deepPurple.shade100.withOpacity(.6),
                      height: getHeight * .09,
                      child: Shimmer(
                        color: Colors.deepPurple.shade200.withOpacity(.3),
                        duration: const Duration(milliseconds: 1000),
                        child: Container(),
                      ));
                });
          }
          return SizedBox();
        }),
      ),
    );
  }
}
