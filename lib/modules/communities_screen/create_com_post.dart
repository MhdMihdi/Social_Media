import 'package:dev_space/modules/home_screen/posts%20cubit/posts_cubit.dart';
import 'package:dev_space/shared/components/components.dart';
import 'package:dev_space/shared/components/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatepostState();
}

class _CreatepostState extends State<CreatePost> {

   //List<XFile>imageFile=[];
  final ImagePicker imagepicker = ImagePicker();

  List<XFile> imageList = []; // List of selected images
  File?imageFile;
  Future<void> imageFromGallery() async {
    List<XFile>?images = await imagepicker.pickMultiImage();

    if (images.isNotEmpty) {
      setState(() {
        imageList = images;
      });

    }
    Navigator.pop(context);
  }
  Future imageFromCamera() async{
    var image = await imagepicker.pickImage(source: ImageSource.camera);
    if (image!=null){
      setState(() {
        imageFile=File(image.path);
      });
    }
    else{}
    Navigator.pop(context);
  }
  showOption(){
    return showDialog(context: context,
      builder:(context) => AlertDialog(
        title:const Text('Make a Choice'),
        content:SingleChildScrollView(
          child:Column(
            children: [
              ListTile(
                leading:const Icon(Icons.image),
                title: const Text('Gallery'),
                onTap:imageFromGallery,
              ),
              ListTile(
                leading:const Icon(Icons.camera),
                title: const Text('Camera'),
                onTap:imageFromCamera,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsCubit(),
      child: BlocConsumer<PostsCubit, PostsState>(
        listener: (context, state) {
          if(state is PostUploadedState){
            showScaffoldSnackBar(title: 'Post Uploaded', context: context,color: Colors.green);
          }
        },
        builder: (context, state) {
          var cubit=PostsCubit.get(context);
          return Scaffold(
            appBar:AppBar(
              backgroundColor:Constants.color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)
              ),
              title:const Text(
                'Create Post',
                style:TextStyle(
                  fontSize:20,
                  color: Colors.white
                ),
              ),
              leading: IconButton(
                onPressed: ()
                {
                  Navigator.pop(context);
                },
                icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                ),
              ),
              actions: [
                TextButton(
                    onPressed: ()
                    {
                      cubit.createPost(context: context, images: imageList);
                    },
                    child:const Text(
                        'Publish',
                        style: TextStyle(
                            color: Colors.white
                        ),
                    ),
                )
              ],
            ),
            body:ListView(
              children:[
                if(state is PostsLoadingState)
                  const LinearProgressIndicator(
                    color: Constants.color,
                  ),
                Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownButton(
                      alignment:Alignment.center,
                      hint:const Text(
                        'post type',
                        style:TextStyle(
                          fontSize:22,
                        ),),
                      items:[
                        "Regular" ,
                        "CV" ,
                        "Job Opportunity",
                        "Question",
                        "Challenge",
                        "Roadmap",
                        "Advise",].map((e) => DropdownMenuItem(
                        value:e,
                        child: Text(e,
                          style:const TextStyle(
                            fontSize:22,
                          ),
                        ),
                      )
                      ).toList(),
                      onChanged:(val){
                        setState(() {
                          cubit.selectedtype= val ;
                        });
                      },
                      value:cubit.selectedtype,
                    ),
                    const SizedBox(
                      height:5,
                    ),
                    const Divider(
                      thickness:1,
                      color:Color(0XFF615AAB),
                    ),
                    MaterialButton(
                      onPressed:showOption, //فتح المعرض
                      child: const Row(
                        children: [
                          Icon(Icons.photo_library,
                            size:40,
                            color:Color(0XFF615AAB),
                          ),
                          SizedBox(
                            width:5,
                          ),
                          Text(
                            'Photos',
                            style:TextStyle(
                              fontSize: 25,
                              color:Color(0XFF615AAB),
                            ),
                          ),

                        ],
                      ),
                    ),
                    const Divider(
                      thickness:1,
                      color:Color(0XFF615AAB),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:7,),
                      child: TextFormField(
                        style:const TextStyle(
                          fontSize:30,
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines:null,
                        controller:cubit.contetPController,
                        decoration:const InputDecoration(
                          hintStyle:TextStyle(
                            fontSize:27,
                            color: Color(0XFF615AAB),
                          ),
                          hintText:'Whats on your mind ?',
                          border:InputBorder.none,
                        ),
                      ),
                    ),
                    imageList.isNotEmpty?
                    ListView.separated(
                       shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: imageList.length,
                        separatorBuilder: (context,index)=>const SizedBox(height: 10.0),
                        itemBuilder: (context,index)=>
                         Image.file(
                        File(imageList[index].path),
                        fit: BoxFit.cover,
                        )
                    ):const SizedBox()

                  ],
                ),
              ),
            ]
            ),
          );
        },
),
);
  }
}
