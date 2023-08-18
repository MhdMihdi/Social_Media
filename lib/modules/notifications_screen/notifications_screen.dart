import 'package:dev_space/modules/notifications_screen/noti_cubit/notification_cubit.dart';
import 'package:dev_space/shared/components/components.dart';
import 'package:dev_space/shared/components/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit()..getOldNotifications(context),
      child: BlocConsumer<NotificationCubit, NotificationState>(
        listener: (context, state) {
         if(state is NotificationErrorState){
           showScaffoldSnackBar(title: state.error, context: context);
         }
        },
        builder: (context, state) {
          var cubit=NotificationCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Constants.color,
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              title: const Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: RefreshIndicator(
              onRefresh: () async
              {},
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:
                      [
                        MyButton(
                          onPressed: ()
                          {
                            cubit.getNewNotifications(context);
                          },
                          title: 'Newest',
                          titleColor: state is NewNotificationLoadedState?Colors.white:Colors.black,
                          color: state is NewNotificationLoadedState?Constants.color:Colors.grey.shade200,
                          radius: 10.0,
                        ),
                        MyButton(
                          onPressed: (){
                            cubit.getOldNotifications(context);
                          },
                          title: 'Oldest',
                          titleColor:state is OldNotificationLoadedState?Colors.white :Colors.black,
                          color: state is OldNotificationLoadedState?Constants.color:Colors.grey.shade200,
                          radius: 10.0,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    if(state is OldNotificationLoadingState || state is NewNotificationLoadingState)
                    Expanded(
                      child: ListView.builder(
                        itemCount: 4,
                        itemBuilder:(context,index)=>Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  color: Colors.deepPurple.shade100.withOpacity(.6),
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              child: Shimmer(
                                color: Colors.deepPurple.shade200.withOpacity(.3),
                                duration: const Duration(milliseconds: 1000),
                                child: Container(),
                              ),
                            )
                        ),
                      ),
                    ),
                    if(state is OldNotificationLoadedState)
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                        const SizedBox(height: 10.0,),
                        itemCount: state.noity.data.length,
                        itemBuilder: (context, index) =>
                            Container(
                              decoration: BoxDecoration(
                                  color: Constants.color,
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              padding: const EdgeInsets.all(8.0),
                              child: MaterialButton(
                                onPressed: () {},
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                      fit: FlexFit.loose,
                                      child: Text(
                                        state.noity.data[index].notification,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Align(
                                        alignment: AlignmentDirectional
                                            .bottomEnd,
                                        child: Text(
                                          'read at :${state.noity.data[index].readAt} ',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                    )
                                  ],
                                ),
                              ),
                            ),
                      ),
                    ),
                    if(state is NewNotificationLoadedState)
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                        const SizedBox(height: 10.0,),
                        itemCount: state.noity.data.length,
                        itemBuilder: (context, index) =>
                            Container(
                              decoration: BoxDecoration(
                                  color: Constants.color,
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              padding: const EdgeInsets.all(8.0),
                              child: MaterialButton(
                                onPressed: () {},
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                      fit: FlexFit.loose,
                                      child: Text(
                                        state.noity.data[index].notification,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Align(
                                        alignment: AlignmentDirectional
                                            .bottomEnd,
                                        child: Text(
                                          'Sent at :${state.noity.data[index].sendAt} ',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                    )
                                  ],
                                ),
                              ),
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
