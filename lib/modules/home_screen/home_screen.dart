import 'package:dev_space/modules/home_screen/posts%20cubit/posts_cubit.dart';
import 'package:dev_space/modules/home_screen/sotry_view_screen.dart';
import 'package:dev_space/modules/search/search_screen.dart';
import 'package:dev_space/shared/components/components.dart';
import 'package:dev_space/shared/components/constants.dart';
import 'package:dev_space/shared/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../../database/models/home_models/home_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var getHeight = MediaQuery.of(context).size.height;
    var getWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => PostsCubit()..getPosts(context),
      child: BlocConsumer<PostsCubit, PostsState>(
        listener: (context, state) {
          if (state is PostsErrorState) {
            showScaffoldSnackBar(title: state.error, context: context);
          }
          if(state is PostsLoadedState && state.posts.message== 'end posts >> refresh'){
            showScaffoldSnackBar(title: 'Refresh', context: context);
          }
          },
        builder: (context, state) {
          var cubit= PostsCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Constants.color,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)
                ),
                title: const Text(
                  'DevSpace',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>SearchScreen())
                      );
                    },
                    icon: const Icon(Icons.search),
                    color: Colors.white,
                    iconSize: 30,
                  ),
                ],
              ),
              body: RefreshIndicator(
                color: Constants.color,
                onRefresh: () async {
                  await context.read<PostsCubit>().getPosts(context);
                },
                child: ListView(
                  children:
                  [
                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          color: Constants.color,
                          icon: const Icon(Icons.account_circle_outlined),
                          iconSize: 45,
                        ),
                        Expanded(
                          child: MyFormField(
                            controller:TextEditingController(),
                            hint: 'Whats on your mind ? ',
                            padding: const EdgeInsets.all(10.0),
                            radius: 70.0,
                            readOnly: true,
                            onTap: ()
                            {
                              Navigator.pushNamed(
                                  context,
                                  NamedRoutes.createPostScreen
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 10,
                    color: Colors.deepPurple.shade200,
                  ),
                  //add story & story view
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              NamedRoutes.storyAddScreen,
                            );
                          },
                          child: const CircleAvatar(
                            radius: 30.0,
                            backgroundColor: Constants.color,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30.0,
                            ),
                          ),
                        ),
                        BlocProvider(
                          create: (context) => PostsCubit()..getActiveStories(context),
                          child: Expanded(
                            child: SizedBox(
                              height: 90.0,
                              child: BlocBuilder<PostsCubit, PostsState>(
                                builder: (context, state) {
                                  return Row(
                                    children:
                                    [
                                      if(state is StoriesLoadedState)

                                    ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) =>
                                          MaterialButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context)=>
                                                StoryViewScreen(
                                                  id: state.stories.data[index][0],
                                                )
                                                )
                                              );
                                            },
                                            child: CircleAvatar(
                                              radius: 30,
                                              backgroundImage: NetworkImage(
                                                  state.stories.data[index][1][0].contains('storage')
                                                      ? Constants.IP +state.stories.data[index][1][0].substring(
                                                      state.stories.data[index][1][0]
                                                          .indexOf('storage'))
                                                      : Constants.IP+  state.stories.data[index][1][0].substring(
                                                      state.stories.data[index][1][0]
                                                          .indexOf('media'))),
                                            ),
                                          ),
                                      itemCount: state.stories.data.length,
                                    ),

                                  if(state is StoriesLoadingState)
                                    ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 4,
                                        itemBuilder: (context, index) =>
                                            CircleAvatar(
                                              radius: 30,
                                              foregroundColor: Colors.deepPurple,
                                              child:  Shimmer(
                                                color: Colors.deepPurple.shade200.withOpacity(.3),
                                                duration: const Duration(milliseconds: 1000),
                                                child: Container(),
                                              ),
                                            )
                                    )

                                    ],
                                  );


                                },
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 10,
                    color: Colors.deepPurple.shade200,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  //post
                  if (state is PostsLoadedState)
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.posts.data.posts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Post(
                            images: state.posts.data.posts[index][5].cast<String>(),
                            isLikedOrDisliked:
                                state.posts.data.posts[index][6] =="my _reaction_on_this_post is like"
                                    ? true:
                                state.posts.data.posts[index][6] =="my _reaction_on_this_post is dislikes"?
                                    false
                                    : null,
                            id: PostModel.fromJson(
                                    state.posts.data.posts[index][4])
                                .id,
                            description: PostModel.fromJson(
                                    state.posts.data.posts[index][4])
                                .content,
                            name: state.posts.data.posts[index][0],
                            timeago: state.posts.data.posts[index][3],
                            likesCount: PostModel.fromJson(
                                    state.posts.data.posts[index][4])
                                .likesCounts,
                            dislikesCount: PostModel.fromJson(
                                    state.posts.data.posts[index][4])
                                .dislikesCounts,
                            type:cubit.type,
                            typee: PostModel.fromJson(
                                state.posts.data.posts[index][4])
                                .type=='Challenge'?true:false,
                            expert: state.posts.data.posts[index][2]=='expert'?true:false,
                            isSave: cubit.isSave==true?true:false,
                            isReported: cubit.isReported==true?true:false,
                          );

                        }),
                  if (state is PostsLoadingState)
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
                ]),
              ));
        },
      ),
    );
  }
}
