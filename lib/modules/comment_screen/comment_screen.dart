
import 'package:dev_space/modules/comment_screen/comment_cubit.dart';
import 'package:dev_space/shared/components/components.dart';
import 'package:dev_space/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class CommentScreen extends StatefulWidget {
  final int?id;
  const CommentScreen({super.key,this.id});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommentCubit()..getComments(context: context,postId: widget.id.toString()),
      child: BlocConsumer<CommentCubit, CommentState>(
        listener: (context, state) {
          if(state is CommentErrorState){
            showScaffoldSnackBar(title: state.error, context: context);
           }
          if(state is CommentReportedState){
            showScaffoldSnackBar(title: 'Reported', context: context,);
           }
          },
        builder: (context, state) {
          var cubit=CommentCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: const Text(
                'Comments',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Constants.color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                await context.read<CommentCubit>().getComments(context: context,postId: widget.id.toString());
              },
              child: Column(
                children: [
                  if(state is CommentLoadingState)
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
                  if(state is CommentLoadedState)
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.comments.data.length,
                      itemBuilder: (context,index)=>
                          Comment(
                            commentId:state.comments.data[index].comment.id,
                            commenter: state.comments.data[index].commenter,
                            commentContent: state.comments.data[index].comment.content,
                            timeAgo: state.comments.data[index].time,
                            likesCount: state.comments.data[index].comment.likesCounts,
                            dislikesCount: state.comments.data[index].comment.dislikesCounts,
                            isLikedOrDisliked: state.comments.data[index].myReaction =="my _reaction_on_this_post is like"
                                ? true:
                            state.comments.data[index].myReaction =="my _reaction_on_this_post is dislikes"?
                            false
                                : null,
                          )
                    ),
                  ),
                  if(state is CommentUploadingState)
                    const LinearProgressIndicator(
                      color: Constants.color,
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2.0,
                              horizontal: 10.0
                          ),
                          child: MyFormField(
                            controller:cubit.contentController,
                            hint: 'Write comment',
                            radius: 20.0,
                            padding: const EdgeInsets.all(10.0),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            cubit.createComment(context: context,id: widget.id.toString());
                          },
                          icon: const Icon(
                            Icons.send_rounded, color: Constants.color,)
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
