import 'package:dev_space/modules/home_screen/posts%20cubit/posts_cubit.dart';
import 'package:dev_space/shared/components/components.dart';
import 'package:dev_space/shared/components/constants.dart';
import 'package:dev_space/shared/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../database/models/home_models/home_model.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var getHeight=MediaQuery.of(context).size.height;
    var getWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
        ),
        backgroundColor: Constants.color,
      ),
      body: BlocProvider(
  create: (context) => PostsCubit()..getMyPosts(context),
  child: BlocConsumer<PostsCubit, PostsState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Container(
                height: getHeight*.24,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Container(
                        width: double.infinity,
                        height:getHeight*.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          image: const DecorationImage(
                              fit: BoxFit.fill,
                              filterQuality: FilterQuality.medium,
                              image: AssetImage(
                                  'assets/images/2.jpg',

                              )
                          ),
                        ),

                      ),
                    ),
                   const CircleAvatar(
                     radius: 64,
                     backgroundColor: Colors.white,
                     child: CircleAvatar(
                       radius: 60.0,
                       // backgroundImage: NetworkImage(
                       //   ''
                       // ),
                     ),
                   )
                  ],
                ),
              ),
              const Text(
                  'Mohammad Mihdi',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              Text(
                  'Bio'
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
              if (state is PostsLoadedState)
                ListView.builder(
                    // shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.posts.data.posts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Post(
                        // images: state.posts.data.posts[index][5].cast<String>(),
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
                        timeago: state.posts.data.posts[index][3],
                        likesCount: PostModel.fromJson(
                            state.posts.data.posts[index][4])
                            .likesCounts,
                        dislikesCount: PostModel.fromJson(
                            state.posts.data.posts[index][4])
                            .dislikesCounts,
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

          ),
    );
  },
),
),
      );
  }
}