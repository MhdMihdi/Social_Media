import 'package:dev_space/modules/home_screen/posts%20cubit/posts_cubit.dart';
import 'package:dev_space/shared/components/components.dart';
import 'package:dev_space/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShareScreen extends StatefulWidget {
  final int?id;
  const ShareScreen({super.key,this.id});

  @override
  State<ShareScreen> createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsCubit(),
      child: BlocConsumer<PostsCubit, PostsState>(
        listener: (context, state) {
          if(state is PostsErrorState){
            showScaffoldSnackBar(title: state.error, context: context);
          }
          if(state is SharePostUploaded){
            showScaffoldSnackBar(title: 'Shared Successfully', context: context,color: Colors.green);
          }
        },
        builder: (context, state) {
          var cubit=PostsCubit.get(context);
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
                'Share it',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Constants.color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  const Text(
                      'The share type :',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                      ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MyRadioButton(
                            title: postType.Regular.name,
                            value: postType.Regular,
                            padding: const EdgeInsets.only(left: 5.0),
                            groupValue: cubit.type,
                            onChanged: (val) {
                              setState(() {
                                cubit.type = val;
                              });
                            }),
                      ),
                      Expanded(
                        child: MyRadioButton(
                            title:
                            postType.Advice.name,
                            value: postType.Advice,
                            groupValue: cubit.type,
                            onChanged: (val) {
                              setState(() {
                                cubit.type = val;
                              });
                            }),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MyRadioButton(
                            title: postType
                                .Challenge.name,
                            titleSize: 13.0,
                            padding: const EdgeInsets.only(left: 5.0),
                            value: postType.Challenge,
                            groupValue: cubit.type,
                            onChanged: (val) {
                              setState(() {
                                cubit.type = val;
                              });
                            }),
                      ),
                      Expanded(
                        child: MyRadioButton(
                            title: postType.Cv.name,
                            value: postType.Cv,
                            groupValue: cubit.type,
                            onChanged: (val) {
                              setState(() {
                                cubit.type = val;
                              });
                            }),
                      ),
                    ],
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: MyRadioButton(
                            title: postType
                                .JobOpportunity.name,
                            padding: const EdgeInsets.only(left: 5.0),
                            titleSize: 15.0,
                            value: postType
                                .JobOpportunity,
                            groupValue: cubit.type,
                            onChanged: (val) {
                              setState(() {
                                cubit.type = val;
                              });
                            }),
                      ),
                      Expanded(
                        child: MyRadioButton(
                            title: postType
                                .Question.name,
                            titleSize: 15.0,
                            value: postType.Question,
                            groupValue: cubit.type,
                            onChanged: (val) {
                              setState(() {
                                cubit.type = val;
                              });
                            }),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MyRadioButton(
                            title:
                            postType.RoadMap.name,
                            value: postType.RoadMap,
                            groupValue: cubit.type,
                            padding: const EdgeInsets.only(left: 5.0),
                            onChanged: (val) {
                              setState(() {
                                cubit.type = val;
                              });
                            }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0,),
                  MyFormField(
                      controller: cubit.contentController,
                      hint: 'Whats on your mind ? ',
                      padding: const EdgeInsets.all(10.0),
                  ),
                  const SizedBox(height: 20.0,),
                  state is SharePostUploading?
                  const Center(
                    child: CircularProgressIndicator(
                      color:Constants.color,
                    ),
                  )
                  :Center(
                    child: MyButton(
                      onPressed: () {
                        cubit.sharePost(
                            context: context,
                            id: widget.id,
                        );
                      },
                      title: 'Share it',
                      titleColor: Colors.white,
                      color: Constants.color,
                      width: 100,
                      height: 50,
                      radius: 20.0,
                    ),
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
