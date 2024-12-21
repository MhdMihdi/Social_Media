import 'package:dev_space/modules/home_screen/posts%20cubit/posts_cubit.dart';
import 'package:dev_space/shared/components/components.dart';
import 'package:dev_space/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

int currentPage = 0;
class StoryViewScreen extends StatefulWidget {
   int?id;

   StoryViewScreen({
    super.key,
    this.id,

  });

  @override
  State<StoryViewScreen> createState() => _StoryViewScreenState();
}

class _StoryViewScreenState extends State<StoryViewScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => PostsCubit()..getStory(context: context, id: widget.id),
      child: BlocConsumer<PostsCubit, PostsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit=PostsCubit.get(context);
          return Scaffold(
              backgroundColor: Constants.color,
              appBar: AppBar(
                backgroundColor: Constants.color,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              ),
              body:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if(state is GetStoryLoadedState)
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      itemCount: state.model.data.posts.length,
                      itemBuilder:(context,index)=> Container(
                        //margin: EdgeInsets.symmetric(vertical: height * .03),
                        width: 200,
                        height:100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Constants.color,
                        ),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.model.data.posts[index][0],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0
                              ),
                            ),
                            Flexible(
                              child: Text(
                                'content : ${state.model.data.posts[index][4]['content']}',
                                //overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),


          );
        },
      ),
    );
  }
}