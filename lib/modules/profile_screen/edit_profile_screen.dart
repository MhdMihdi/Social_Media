import 'dart:io';

import 'package:dev_space/shared/components/components.dart';
import 'package:dev_space/shared/components/constants.dart';
import 'package:dev_space/shared/components/select_photo_options_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}


class _EditProfileScreenState extends State<EditProfileScreen> {
  File?profileImage;
  File?coverImage;
  //Image Picker
  Future _pickProfileImage(ImageSource source) async
  {
    try {
      final image = await ImagePicker().pickImage(
        source: source,
      );
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropProfileImage(imageFile: img);
      profileImage = img;
      setState(() {});
    } on PlatformException catch (e) {
      print(e);
    }
  }

  //ImageCropper
  Future<File?> _cropProfileImage({required File imageFile}) async
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
  void showSelectProfilePhotoOptions(BuildContext context) {
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
              onTap: _pickProfileImage,
            ),
          ),
    );
  }

  //Image Picker
  Future _pickCoverImage(ImageSource source) async
  {
    try {
      final image = await ImagePicker().pickImage(
        source: source,
      );
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropCoverImage(imageFile: img);
      profileImage = img;
      setState(() {});
    } on PlatformException catch (e) {
      print(e);
    }
  }

  //ImageCropper
  Future<File?> _cropCoverImage({required File imageFile}) async
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
  void showSelectCoverPhotoOptions(BuildContext context) {
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
              onTap: _pickCoverImage,
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: const Text(
          'Edit Profile',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
        ),
        backgroundColor: Constants.color,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        actions:
        [
          TextButton(
              onPressed: (){},
              child: const Text(
                'Update',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0

                ),
              )
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children:
          [
            Container(
              height: 190.0,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Align(
                    child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 140.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            image:  coverImage==null?
                            DecorationImage(
                                fit: BoxFit.fill,
                                filterQuality: FilterQuality.medium,
                                image: AssetImage(
                                  'assets/images/2.jpg',
                                )
                            )
                                :DecorationImage(
                                fit: BoxFit.fill,
                                filterQuality: FilterQuality.medium,
                                image: FileImage(
                                  coverImage!,
                                )
                            ),
                            ),
                          ),
                        IconButton(
                            onPressed: ()
                            {
                              showSelectCoverPhotoOptions(context);
                            },
                            icon: CircleAvatar(
                              backgroundColor: Constants.color,
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,

                              ),
                            )
                        )
                      ],
                    ),
                    alignment: AlignmentDirectional.topCenter,
                  ),
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      CircleAvatar(
                        radius: 54,
                        backgroundColor: Colors.white,
                        child: profileImage==null?
                        CircleAvatar(
                          radius: 50.0,
                          backgroundColor: Constants.color,
                          backgroundImage: AssetImage(
                            'assets/images/male.png',
                          ),
                        )
                        :CircleAvatar(
                         radius: 50.0,
                         backgroundImage: FileImage(profileImage!),
                        ),

                      ),
                      IconButton(
                          onPressed: ()
                          {
                            showSelectProfilePhotoOptions(context);
                          },
                          icon: const CircleAvatar(
                            radius: 15.0,
                            backgroundColor: Constants.color,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 20.0,

                            ),
                          )
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            MyFormField(
              controller:TextEditingController(),
              type: TextInputType.emailAddress,
              label: 'Name',
              prefix: Icons.person,
              padding: const EdgeInsets.all(
                  15.0
              ),
              validate: (value)
              {
                if(value!.isEmpty)
                {
                  return 'Email is required';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 15.0,
            ),
            MyFormField(
              controller:TextEditingController(),
              type: TextInputType.emailAddress,
              label: 'Bio',
              prefix: Icons.access_time,
              padding: const EdgeInsets.all(
                  15.0
              ),
              validate: (value)
              {
                if(value!.isEmpty)
                {
                  return 'Email is required';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
