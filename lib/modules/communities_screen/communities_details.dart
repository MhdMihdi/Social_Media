
import 'package:dev_space/database/models/communties_models/communties_detalis_model.dart';
import 'package:dev_space/modules/communities_screen/communities_cubit.dart';
import 'package:dev_space/shared/components/components.dart';
import 'package:dev_space/shared/components/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class CommunitiesDetailsScreen extends StatelessWidget {
  final int?id;

  const CommunitiesDetailsScreen({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    var getHeight=MediaQuery.of(context).size.height;
    var getWidth=MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) =>
      CommunitiesCubit()
        ..getCommunityDetails(id: id, type: 'all'),
      child: BlocConsumer<CommunitiesCubit, CommunitiesState>(
        listener: (context, state) {
          if(state is CommunitiesErrorState){
            showScaffoldSnackBar(title: state.error, context: context);
          }
          if(state is CommunitiesDetailsLoadedState && state.communities.message=='end posts >> refresh'){
            showScaffoldSnackBar(title: 'Refresh', context: context,);
          }
        },
        builder: (context, state) {
          var cubit=CommunitiesCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Community Details',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0
                ),
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)
              ),
              backgroundColor: Constants.color,
            ),
            body: RefreshIndicator(
              onRefresh: () async{
                await context.read<CommunitiesCubit>().getCommunityDetails(id: id, type: 'all');
              },
              child: ListView(
                //shrinkWrap: true,
                children:
                [
                  Column(
                    children:
                    [
                      if(state is CommunitiesDetailsLoadingState)
                        ListView.builder(
                          itemCount: 4,
                          shrinkWrap: true,
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
                      if(state is CommunitiesDetailsLoadedState)
                        Column(
                          children:
                          [
                            if(state.communities.photo.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image(
                                  image: NetworkImage(
                                      state.communities.photo[0]!.contains('storage')
                                          ? Constants.IP+ state.communities.photo[0]!.substring(
                                          state.communities.photo[0]!
                                              .indexOf('storage')
                                      )
                                          : Constants.IP +state.communities.photo[0]!.substring(
                                        state.communities.photo[0]!
                                            .indexOf('media'),
                                      )
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.communities.info.name,
                                    style: const TextStyle(
                                      color: Constants.color,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0,), //
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${state.communities.info.subscriberCounts} Subscriber' ,
                                        style: const TextStyle(
                                          color: Constants.color,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const CircleAvatar(
                                        radius: 3.0,
                                        backgroundColor: Constants.color,
                                      ),
                                      const SizedBox(width: 5.0,),
                                      const Text(
                                        'Joined ',
                                        style: TextStyle(
                                          color: Color(0XFF615AAB),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      Container(
                        width: double.infinity,
                        height: 10,
                        color: Colors.deepPurple.shade200,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            color: Constants.color,
                            icon: const Icon(Icons.account_circle_outlined),
                            iconSize: 45,
                          ),
                          Expanded(
                            child: MyFormField(
                              controller: TextEditingController(),
                              label: 'Whats on your mind ? ',
                              padding: const EdgeInsets.all(10.0),
                              radius: 70.0,
                              readOnly: true,
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: 10,
                        color: Colors.deepPurple.shade200,
                      ),
                      Row(
                          children:[
                            MyButton(
                                onPressed: (){},
                                title: 'Advice',
                                titleColor: Colors.white,
                                color: Constants.color,
                                radius: 20.0,
                            ),
                          ]
                      ),
                      if(state is CommunitiesDetailsLoadingState)
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
                      if(state is CommunitiesDetailsLoadedState)
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.communities.data.posts.length,
                            itemBuilder:(context,index) {
                              return CommunityPost(
                                images: state.communities.data.posts[index][5].cast<
                                    String>(),
                                isLikedOrDisliked:
                                state.communities.data.posts[index][6] ==
                                    "my _reaction_on_this_post is like"
                                    ? true :
                                state.communities.data.posts[index][6] ==
                                    "my _reaction_on_this_post is dislikes" ?
                                false
                                    : null,
                                id: PostClass.fromJson(
                                    state.communities.data.posts[index][4])
                                    .id,
                                description: PostClass.fromJson(
                                    state.communities.data.posts[index][4])
                                    .content,
                                name: state.communities.data.posts[index][0],
                                timeago: state.communities.data.posts[index][3],
                                likesCount: PostClass.fromJson(
                                    state.communities.data.posts[index][4])
                                    .likesCounts,
                                dislikesCount: PostClass.fromJson(
                                    state.communities.data.posts[index][4])
                                    .dislikesCounts,

                              );
                            }
                        ),
                    ],
                  )



                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
