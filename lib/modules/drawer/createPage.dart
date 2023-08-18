
import 'dart:io';

import 'package:dev_space/shared/components/components.dart';
import 'package:dev_space/shared/components/constants.dart';
import 'package:dev_space/shared/components/select_photo_options_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';


class CreatePage extends StatefulWidget {
   CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
    var Namepage =TextEditingController();

    var Typepage =TextEditingController();

    var Emaileaddrs=TextEditingController();

    var Biopage =TextEditingController();

   File?imag;

   //Image Picker
   Future _pickImage(ImageSource source) async
   {
     try {
       final image = await ImagePicker().pickImage(
         source: source,
       );
       if (image == null) return;
       File? img = File(image.path);
       img = await _cropImage(imageFile: img);
       imag = img;
       setState(() {

       });
     } on PlatformException catch (e) {
       print(e);
     }
   }

   //ImageCropper
   Future<File?> _cropImage({required File imageFile}) async
   {
     CroppedFile? croppedImage =
     await ImageCropper().cropImage(
       sourcePath: imageFile.path,
       aspectRatioPresets:
       [
         CropAspectRatioPreset.square,
         CropAspectRatioPreset.ratio3x2,
         CropAspectRatioPreset.original,
         CropAspectRatioPreset.ratio4x3,
         CropAspectRatioPreset.ratio16x9,
       ],
       uiSettings:
       [
         AndroidUiSettings(
             toolbarTitle: 'Cropper'
         ),
       ],
     );
     if (croppedImage == null) return null;
     return File(croppedImage.path);
   }

   //bottomSheet
   void showSelectPhotoOptions(BuildContext context) {
     showModalBottomSheet(
       context: context,
       isScrollControlled: true,
       shape: const RoundedRectangleBorder(
         borderRadius: BorderRadius.vertical(
           top: Radius.circular(25.0),
         ),
       ),
       builder: (context) =>
           SingleChildScrollView(
             child: SelectPhotoOptionsScreen(
               onTap: _pickImage,
             ),
           ),
     );
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children:
              [
                const Header(),
                Positioned(
                  bottom: -55,
                  child: InkWell(
                    onTap: ()
                    {
                      //cubit.showSelectPhotoOptions(context);
                    },
                    child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,

                      children:
                      [
                        CircleAvatar(
                          radius: 63.0,
                          backgroundColor: Colors.white,
                          child:imag==null?
                          CircleAvatar(
                            radius: 60.0,
                            backgroundColor: Constants.color,
                            backgroundImage: AssetImage(
                              'assets/images/male.png',
                            ),
                          )
                              :CircleAvatar(
                            radius: 60.0,
                            backgroundImage: FileImage(imag!),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20.0,
                          child: CircleAvatar(
                            radius: 17.0,
                            backgroundColor: Constants.color,
                            child: Icon(
                              Icons.add,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 60.0,),
            MyFormField(
              labelColor:Color(0XFF615AAB),
                prefixColor:Color(0XFF615AAB),
                controller:Namepage,
                type:TextInputType.streetAddress,
                label: 'Name page',
                prefix: Icons.abc,
                padding: const EdgeInsets.all(
                    15.0
                ),
                validate: (value)
                {
                  if(value!.isEmpty)
                  {
                    return 'Your Namepage is required';
                  }
                  return null;
                }
            ),
            SizedBox(
              height:15,
            ),
            MyFormField(
                labelColor:Color(0XFF615AAB),
                prefixColor:Color(0XFF615AAB),
                controller: Typepage,
                type:TextInputType.streetAddress,
                label: 'Type page',
                prefix: Icons.merge_type,
                padding: const EdgeInsets.all(
                    15.0
                ),
                validate: (value)
                {
                  if(value!.isEmpty)
                  {
                    return 'Your current location is required';
                  }
                  return null;
                }
            ),
            SizedBox(
              height:15,
            ),
            MyFormField(

                labelColor:Color(0XFF615AAB),
                prefixColor:Color(0XFF615AAB),
                controller: Emaileaddrs,
                type:TextInputType.streetAddress,
                label: 'Emaile Address',
                prefix: Icons.email,
                padding: const EdgeInsets.all(
                    15.0
                ),
                validate: (value)
                {
                  if(value!.isEmpty)
                  {
                    return 'Your current location is required';
                  }
                  return null;
                }
            ),
            SizedBox(
              height:15,
            ),
            MyFormField(
                labelColor:Color(0XFF615AAB),
                prefixColor:Color(0XFF615AAB),
                controller:Biopage,
                type:TextInputType.streetAddress,
                label: 'Bio page',
                prefix: Icons.person,
                padding: const EdgeInsets.all(
                    15.0
                ),
                validate: (value)
                {
                  if(value!.isEmpty)
                  {
                    return 'Your current location is required';
                  }
                  return null;
                }
            ),
            SizedBox(
              height:15,
            ),
            Container(
              color:Color(0XFF615AAB),
              child: MaterialButton(
                onPressed: (){
                  print(Namepage.text);
                  print(Typepage.text);
                  print(Emaileaddrs.text);
                  print(Biopage.text);
                },
              child:Text(
                'Create',
                style:TextStyle(
                  color:Colors.white,
                  fontSize:30,
                ),
              ),
              ),
            )
          ],
        ),
      ),


    );
  }
}
