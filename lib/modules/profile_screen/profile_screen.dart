// ignore_for_file: unused_local_variable


import 'package:dev_space/database/models/home_models/home_model.dart';
import 'package:dev_space/modules/profile_screen/cubit/profile_cubit.dart';
import 'package:dev_space/modules/profile_screen/data_between_pro&edit.dart';
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
      child: BlocConsumer<ProfileCubit,ProfileState>(
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
                  await context.read<ProfileCubit>().getProfilePosts(context);
                },
                child: ListView(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                           if(state is ProfileLoadingState)
                             Center(
                               child:  CircleAvatar(
                                 radius: 64,
                                 backgroundColor: Colors.white,
                                 child: CircleAvatar(
                                   radius: 60.0,
                                   foregroundColor: Colors.deepPurple,
                                   child: Shimmer(
                                     color: Colors.deepPurple.shade200.withOpacity(.3),
                                     duration: const Duration(milliseconds: 1000),
                                     child: Container(),
                                   ),
                                 ),
                               ),
                             ),
                            if(state is ProfileLoadedState)
                             Center(
                              child:  CircleAvatar(
                                   radius: 64,
                                   backgroundColor: Colors.white,
                                   child:state.profile.mediaUrl==null?
                                   const CircleAvatar(
                                     radius: 60.0,
                                       backgroundColor: Constants.color,
                                     backgroundImage:AssetImage('assets/images/male.png')
                                   )
                                    : CircleAvatar(
                                        radius: 60.0,
                                       backgroundColor: Constants.color,
                                        backgroundImage:NetworkImage(
                                            state.profile.mediaUrl!.contains('storage')
                                                ? Constants.IP+ state.profile.mediaUrl!.substring(
                                                state.profile.mediaUrl!
                                                .indexOf('storage'))
                                                : Constants.IP +state.profile.mediaUrl!.substring(
                                                state.profile.mediaUrl!
                                                .indexOf('media'),),
                                        )
                                    ),
                              ),
                             ),
                            if(state is ProfileLoadingState)
                              ListView.separated(
                                  separatorBuilder: (context,index)=>const SizedBox(
                                    height: 5.0,
                                  ),
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: 2,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50.0
                                      ),
                                      child: Container(
                                        width: 15,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          // color: Colors.grey.shade300,
                                          color: Colors.deepPurple.shade100.withOpacity(.6),
                                          borderRadius: BorderRadius.circular(20.0),
                                        ),
                                        child: Shimmer(
                                          color: Colors.deepPurple.shade200.withOpacity(.3),
                                          duration: const Duration(milliseconds: 1000),
                                          child: Container(),
                                        ),
                                      ),
                                    );
                                  }),
                            if(state is ProfileLoadedState)
                              Center(
                              child: Column(
                                children: [
                                   Text(
                                      '${state.profile.user.firstName} ${state.profile.user.lastName}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                   Text(
                                      state.profile.user.bio ?? ''
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children:
                              [
                                Expanded(
                                  flex: 2,
                                  child: MyButton(
                                      onPressed: ()
                                      {
                                        Navigator.pushNamed(
                                          context,
                                          NamedRoutes.storyAddScreen,
                                        );
                                      },
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
                                        if(state is ProfileLoadedState) {
                                          Navigator.pushNamed(
                                              context,
                                              NamedRoutes.editProfileScreen,
                                              arguments: Data(
                                                photo:state.profile.mediaUrl!=null?state.profile.mediaUrl!.contains('storage')
                                                    ? Constants.IP +state.profile.mediaUrl!.substring(
                                                    state.profile.mediaUrl!
                                                        .indexOf('storage'))
                                                    : Constants.IP+  state.profile.mediaUrl!.substring(
                                                    state.profile.mediaUrl!
                                                        .indexOf('media')):null,
                                                firstName: state.profile.user.firstName,
                                                lastName: state.profile.user.lastName,
                                                birthDate: state.profile.user.birthDate,
                                                email: state.profile.user.email,
                                                phoneNumber: state.profile.user.phoneNumber,
                                                currentLocation:state.profile.user.currentLocation ,
                                                programmingAge:state.profile.user.programmingAge ,
                                                bio: state.profile.user.bio,
                                                country: state.profile.user.country,
                                                specialty: state.profile.user.specialty?.specialty,
                                                section: state.profile.user.specialty?.section,
                                                framework:state.profile.user.specialty?.framework,
                                                language:state.profile.user.specialty?.language,
                                                studySemester: state.profile.user.student?.studySemester,
                                                currentYear: state.profile.user.student?.currentYear,
                                                studySequence: state.profile.user.student?.studySequence,
                                                yearsAsExpert:state.profile.user.expert?.yearsAsExpert ,
                                                workAtCompany: state.profile.user.expert?.workAtCompany,
                                                companies: state.profile.user.expert?.companies
                                              )
                                          );
                                        }
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
                            const SizedBox(
                              height: 5.0,
                            ),
                            //info
                            if(state is ProfileLoadingState)
                              ListView.separated(
                                  separatorBuilder: (context,index)=>const SizedBox(
                                    height: 5.0,
                                  ),
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: 4,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50.0
                                      ),
                                      child: Container(
                                        width: 15,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          // color: Colors.grey.shade300,
                                          color: Colors.deepPurple.shade100.withOpacity(.6),
                                          borderRadius: BorderRadius.circular(20.0),
                                        ),
                                        child: Shimmer(
                                          color: Colors.deepPurple.shade200.withOpacity(.3),
                                          duration: const Duration(milliseconds: 1000),
                                          child: Container(),
                                        ),
                                      ),
                                    );
                                  }),
                            if(state is ProfileLoadedState )
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                [
                                  if(state.profile.user.student!=null)
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'My Study:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      const SizedBox(height: 5.0,),
                                      Row(
                                        children: [
                                          const Icon(Icons.school),
                                          const SizedBox(width: 5.0,),
                                          Text(
                                            state.profile.user.student!.studySemester,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5.0,),
                                      Row(
                                        children: [
                                          const Icon(Icons.school),
                                          const SizedBox(width: 5.0,),
                                          Text(
                                            state.profile.user.student!.currentYear.toString(),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5.0,),
                                      Row(
                                        children: [
                                          const Icon(Icons.school),
                                          const SizedBox(width: 5.0,),
                                          Text(
                                            state.profile.user.student!.section,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5.0,),
                                      Row(
                                        children: [
                                          const Icon(Icons.school),
                                          const SizedBox(width: 5.0,),
                                          Text(
                                            state.profile.user.student!.studySequence,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5.0,),
                                    ],
                                  ),
                                  if(state.profile.user.expert!=null)
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'My Study:',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        const SizedBox(height: 5.0,),
                                        Row(
                                          children: [
                                            const Icon(Icons.star),
                                            const SizedBox(width: 5.0,),
                                            Text(
                                              state.profile.user.expert!.companies,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5.0,),
                                        Row(
                                          children: [
                                            const Icon(Icons.star),
                                            const SizedBox(width: 5.0,),
                                            Text(
                                              state.profile.user.expert!.yearsAsExpert.toString(),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5.0,),
                                        Row(
                                          children: [
                                            const Icon(Icons.school),
                                            const SizedBox(width: 5.0,),
                                            Text(
                                              state.profile.user.expert!.workAtCompany,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5.0,),
                                      ],
                                    ),
                                  if(state.profile.user.specialty!=null)
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                          'My Specialty:',
                                        style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                        ),
                                      ),
                                      const SizedBox(height: 5.0,),
                                      Row(
                                        children: [
                                          const Icon(Icons.laptop_outlined),
                                          const SizedBox(width: 5.0,),
                                          Text(
                                             '${state.profile.user.specialty?.specialty}',
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5.0,),
                                      Row(
                                        children: [
                                          const Icon(Icons.laptop_outlined),
                                          const SizedBox(width: 5.0,),
                                          Text('${state.profile.user.specialty?.section}'),
                                        ],
                                      ),
                                      const SizedBox(height: 5.0,),
                                      Row(
                                        children: [
                                          const Icon(Icons.laptop_outlined),
                                          const SizedBox(width: 5.0,),
                                          Text('${state.profile.user.specialty?.framework}'),
                                        ],
                                      ),
                                      const SizedBox(height: 5.0,),
                                      Row(
                                        children: [
                                          const Icon(Icons.laptop_outlined),
                                          const SizedBox(width: 5.0,),
                                          Text('${state.profile.user.specialty?.language}'),
                                        ],
                                      ),
                                      const SizedBox(height: 5.0,),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Divider(
                                height: 1,
                                color: Colors.grey,
                              ),
                            ),
                            //posts
                            BlocProvider(
                                create: (context)=>ProfileCubit()..getProfilePosts(context),
                                child: BlocBuilder<ProfileCubit, ProfileState>(
                                builder: (context, state) {
                                  return Column(
                                  children:
                                  [
                                    if (state is ProfilePostsLoadedState)
                                      ListView.builder(
                                          shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemCount: state.posts.data.posts.length,
                                          itemBuilder: (BuildContext context, int index) {

                                            return ProfilePost(
                                              images: state.posts.data.posts[index][5].cast<String>(),
                                              isLikedOrDisliked:
                                              state.posts.data.posts[index][6] =="my _reaction_on_this_post is like"
                                                  ? true:
                                              state.posts.data.posts[index][6] =="my _reaction_on_this_post is dislike"?
                                              false
                                                  : null,
                                              id: PostModel.fromJson(
                                                  state.posts.data.posts[index][4])
                                                  .id,
                                              description: PostModel.fromJson(
                                                  state.posts.data.posts[index][4])
                                                  .content,
                                              name: state.posts.data.posts[index][0],
                                              //profileImage: state.posts.data.posts[index].join('')[1],
                                              timeago: state.posts.data.posts[index][3],
                                              likesCount: PostModel.fromJson(
                                                  state.posts.data.posts[index][4])
                                                  .likesCounts,
                                              dislikesCount: PostModel.fromJson(
                                                  state.posts.data.posts[index][4])
                                                  .dislikesCounts,
                                              userId: PostModel.fromJson(
                                                  state.posts.data.posts[index][4]).userId,
                                            );
                                          }),

                                    if (state is ProfilePostsLoadingState)
                                      ListView.builder(
                                          shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemCount: 5,
                                          itemBuilder: (BuildContext context, int index) {
                                            return Container(
                                              margin:
                                              EdgeInsets.symmetric(vertical: getHeight * .03),
                                              padding: const EdgeInsets.all(4.0),
                                              width: getWidth * .95,
                                              height: getHeight * .45,
                                              decoration: BoxDecoration(
                                                // color: Colors.grey.shade300,
                                                color: Colors.deepPurple.shade100.withOpacity(.6),
                                                borderRadius: BorderRadius.circular(20.0),
                                              ),
                                              child: Shimmer(
                                                color: Colors.deepPurple.shade200.withOpacity(.3),
                                                duration: const Duration(milliseconds: 1000),
                                                child: Container(),
                                              ),
                                            );
                                          }),
                                  ],
                                );
  },
),
                            ),
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