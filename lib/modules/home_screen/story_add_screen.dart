import 'dart:io';
import 'package:dev_space/modules/home_screen/posts%20cubit/posts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  File? image;
  final ImagePicker picker = ImagePicker();
  var storyContentFormKey = GlobalKey<FormState>();

  Future uploadImage() async {
    try {
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;
      // if (pickedImage != null) {
      final image2 = File(pickedImage.path);
      setState(() {});
      image = image2;
    } on PlatformException catch (e) {
      debugPrint('Failed to upload image $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController contentController = TextEditingController();
    contentController.text = '';
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
        child: BlocListener<PostsCubit, PostsState>(
          listener: (context, state) {
            if (state is PostUploadedState) {
              Navigator.of(context).pop();
              showScaffoldSnackBar(
                  title: "uploaded successfully",
                  context: context,
                  color: Colors.green);
            }
            if (state is PostsErrorState) {
              showScaffoldSnackBar(
                title: state.error,
                context: context,
              );
            }
          },
          child: Column(
            children: [
              SizedBox(
                  height: 140,
                  width: 140,
                  child: Lottie.asset("assets/images/addstory.json")),
              const SizedBox(height: 10),
              Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Add photo:',
                            style: TextStyle(
                              //fontFamily: 'SignikaNegative',
                              fontSize: 16,
                              color: Colors.purple.shade50,
                            )),
                      ),
                      GestureDetector(
                        child: image != null
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.file(
                                  image!,
                                  // height: 165,
                                  // width: 165,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 5),
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.purple.shade200,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                          child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Icon(
                                          Icons.add_photo_alternate_outlined,
                                          size: 150,
                                          color: Colors.purple.shade200,
                                        ),
                                      ))),
                                ),
                              ),
                        onTap: () {
                          uploadImage();
                          setState(() {});
                        },
                        onLongPress: () {
                          image = null;
                          setState(() {});
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text('long press on the photo to delete it.',
                            style: TextStyle(
                              //fontFamily: 'SignikaNegative',
                              fontSize: 13,
                              color: Colors.grey,
                            )),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
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
                            },
                            label: 'story content',
                            controller: contentController,
                          ),
                        ),
                      ),
                      BlocBuilder<PostsCubit, PostsState>(
                        builder: (context, state) {
                          return Center(
                            child: state is PostsLoadingState
                                ? const CircularProgressIndicator(
                                    color: Colors.deepPurple,
                                  )
                                : MyButton(
                                    width: 240,
                                    height: 50,
                                    title: "Share",
                                    //todo: add title field
                                    //todo: add more than one image , video is the in the same way
                                    onPressed: () async {
                                      storyContentFormKey.currentState!
                                          .validate();
                                      context.read<PostsCubit>().createPost(
                                          title: '',
                                          type: 'story',
                                          content: contentController.text,
                                          images: [image!],
                                          videos: []);
                                    },
                                  ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
