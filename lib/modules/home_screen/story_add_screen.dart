import 'dart:io';
import 'package:dev_space/modules/home_screen/posts%20cubit/posts_cubit.dart';
import 'package:dev_space/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import '../../../shared/components/components.dart';

class StoryAddScreen extends StatefulWidget {
  const StoryAddScreen({Key? key}) : super(key: key);

  @override
  State<StoryAddScreen> createState() => _StoryAddState();
}

class _StoryAddState extends State<StoryAddScreen> {
  //File? image;
  final ImagePicker picker = ImagePicker();
  var storyContentFormKey = GlobalKey<FormState>();
  TextEditingController contentController = TextEditingController();
  final ImagePicker imagepicker = ImagePicker();

  List<XFile> imageList = []; // List of selected images
  //File?imageFile;
  Future<void> imageFromGallery() async {
    List<XFile>?images = await imagepicker.pickMultiImage();
    if (images.isNotEmpty) {
      setState(() {
        imageList = images;
      });

    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Create New Story",
          style: TextStyle(),
        )),
      ),
      body: BlocProvider(
        create: (context) => PostsCubit(),
        child: BlocConsumer<PostsCubit, PostsState>(
          listener: (context, state) {
            if(state is StoryUploadedState){
              showScaffoldSnackBar(title: 'Story Uploaded', context: context,color: Colors.green);
            }
          },
           builder:(context,state)
           {
             var cubit=PostsCubit.get(context);
            return ListView(
                 children:[
                   Column(
                   children: [
                       SizedBox(
                       height: 140,
                           width: 140,
                           child: Lottie.asset("assets/images/addstory.json")
                       ),
                       const SizedBox(height: 10),
                       Center(
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10.0,),
                         Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          key: storyContentFormKey,
                          child: MyFormField(
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                showScaffoldSnackBar(
                                    title: "content is required",
                                    context: context);
                              }
                              return null;
                            },
                            label: 'story content',
                            controller: contentController,
                          ),
                        ),
                      ),
                       state is PostsLoadingState
                        ?const Center(
                          child: CircularProgressIndicator(
                            color: Constants.color,
                          ),
                        )
                         : Center(
                            child: MyButton(
                                width: 100,
                                height: 50,
                                color: Constants.color,
                                titleColor: Colors.white,
                                radius: 15.0,
                                title: "Share",
                                //todo: add title field
                                //todo: add more than one image , video is the in the same way
                                onPressed: () async {
                                  storyContentFormKey.currentState!.validate();
                                  cubit.createStory(context: context, images: imageList,content: contentController.text);
                                  },
                              ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            )
             ]
            );



        }
      ),
    ));
  }
}
