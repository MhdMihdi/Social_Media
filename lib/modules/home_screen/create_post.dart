import 'package:dev_space/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatepostState();
}

class _CreatepostState extends State<CreatePost> {
  var selectedtype ;
   List<XFile?>?imageFile;
  final ImagePicker imagepicker = ImagePicker();

  Future imageFromGallery() async{
    var image = await imagepicker.pickMultiImage();
    if (image.isNotEmpty){
      setState(() {
        imageFile=image;
      });
    }
    else{}

    Navigator.pop(context);
  }
  Future imageFromCamera() async{
    var image = await imagepicker.pickMultiImage();
    if (image.isNotEmpty){
      setState(() {
        imageFile=image;
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
    return Scaffold(
      appBar:AppBar(
        backgroundColor:Color(0XFF615AAB),
        title:const Text(
          'Create Post',
          style:TextStyle(
            fontSize:20,
            color: Colors.white
          ),
        ),
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
          ),
        ),
        actions: [
          TextButton(
              onPressed: (){},
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
          Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButton(      // القائمة المنسدلة
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
                    selectedtype= val ;
                  });
                },
                value:selectedtype,
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
                      'Photo / Video',
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
              imageFile!=null&&imageFile!.isNotEmpty?
              ListView.builder(
                 shrinkWrap: true,
                  itemCount: imageFile!.length,
                  itemBuilder: (context,index)=>
                      Image.file(
                        imageFile![index] as File,
                        fit: BoxFit.cover,
                      )
              ):Text('')

            ],
          ),
        ),
      ]
      ),
    );
  }
}
