// ignore_for_file: unused_local_variable


import 'package:dev_space/modules/profile_screen/profile_cubit.dart';
import 'package:dev_space/shared/components/components.dart';
import 'package:dev_space/shared/components/constants.dart';
import 'package:dev_space/shared/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer_animation/shimmer_animation.dart';




class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var getHeight=MediaQuery.of(context).size.height;
    var getWidth=MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfileInfo(context),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if(state is ProfileErrorState){
            showScaffoldSnackBar(title: state.error, context: context);
          }
        },
        builder: (context, state) {
          return Scaffold(
              body: RefreshIndicator(
                color: Constants.color,
                onRefresh: ()async{
                  await context.read<ProfileCubit>().getProfileInfo(context);
                  //posts
                },
                child: ListView(

                  children: [
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children:
                          [
                            const Center(
                              child:  CircleAvatar(
                                   radius: 64,
                                   backgroundColor: Colors.white,
                                   child: CircleAvatar(
                                     radius: 60.0,
                                     // backgroundImage: NetworkImage(
                                     //   ''
                                     // ),
                                   ),
                                 ),
                            ),
                            Column(
                              children: [
                                const Text(
                                    'Mohammad Mihdi',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                                const Text(
                                    'Bio'
                                ),
                              ],
                            ),
                            Row(
                              children:
                              [
                                Expanded(
                                  flex: 2,
                                  child: MyButton(
                                      onPressed: (){},
                                      title: 'add story',
                                      titleSize: 20.0,
                                      titleColor: Colors.white,
                                      color: Constants.color,
                                      radius: 10.0,
                                  ),
                                ),
                                Expanded(
                                  child: MyButton(
                                      onPressed: ()
                                      {
                                         Navigator.pushNamed(
                                             context,
                                             NamedRoutes.editProfileScreen
                                         );
                                      },
                                      title: 'edit Profile',
                                      titleColor: Colors.white,
                                      color: Constants.color,
                                      radius: 10.0,
                                  ),
                                ),
                              ],
                            ),
                            MyButton(
                              onPressed: (){},
                              width: double.infinity,
                              title: 'add post',
                              titleSize: 25.0,
                              titleColor: Colors.white,
                              color: Constants.color,
                              radius: 10.0,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Divider(
                                height: 1,
                                color: Colors.grey,
                              ),
                            ),
                            //info

                            // if (state is PostsLoadedState)
                            //   ListView.builder(
                            //       // shrinkWrap: true,
                            //       // physics: const NeverScrollableScrollPhysics(),
                            //       itemCount: state.posts.data.posts.length,
                            //       itemBuilder: (BuildContext context, int index) {
                            //         return Post(
                            //           // images: state.posts.data.posts[index][5].cast<String>(),
                            //           isLikedOrDisliked:
                            //           state.posts.data.posts[index][6] =="my _reaction_on_this_post is like"
                            //               ? true:
                            //           state.posts.data.posts[index][6] =="my _reaction_on_this_post is dislike"?
                            //           false
                            //               : null,
                            //           id: PostModel.fromJson(
                            //               state.posts.data.posts[index][4])
                            //               .id,
                            //           description: PostModel.fromJson(
                            //               state.posts.data.posts[index][4])
                            //               .content,
                            //           name: state.posts.data.posts[index][0],
                            //           timeago: state.posts.data.posts[index][3],
                            //           likesCount: PostModel.fromJson(
                            //               state.posts.data.posts[index][4])
                            //               .likesCounts,
                            //           dislikesCount: PostModel.fromJson(
                            //               state.posts.data.posts[index][4])
                            //               .dislikesCounts,
                            //         );
                            //       }),
                            // if (state is PostsLoadingState)
                            //   ListView.builder(
                            //       shrinkWrap: true,
                            //       physics: const NeverScrollableScrollPhysics(),
                            //       itemCount: 5,
                            //       itemBuilder: (BuildContext context, int index) {
                            //         return Container(
                            //           margin:
                            //           EdgeInsets.symmetric(vertical: getHeight * .03),
                            //           padding: const EdgeInsets.all(4.0),
                            //           width: getWidth * .95,
                            //           height: getHeight * .45,
                            //           decoration: BoxDecoration(
                            //             // color: Colors.grey.shade300,
                            //             color: Colors.deepPurple.shade100.withOpacity(.6),
                            //             borderRadius: BorderRadius.circular(20.0),
                            //           ),
                            //           child: Shimmer(
                            //             color: Colors.deepPurple.shade200.withOpacity(.3),
                            //             duration: const Duration(milliseconds: 1000),
                            //             child: Container(),
                            //           ),
                            //         );
                            //       }),
                          ]
                        ),

                        ),
                  ],
                ),


              )
            );
        },
      ),
    );
  }
}