
import 'dart:io';
import 'package:dev_space/database/Services/posts_service.dart';
import 'package:dev_space/database/Services/user_service.dart';
import 'package:dev_space/database/models/home_models/home_model.dart';
import 'package:dev_space/database/models/profile_model/profile_model.dart';
import 'package:dev_space/shared/components/constants.dart';
import 'package:dev_space/shared/components/select_photo_options_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';


part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  getProfileInfo(context)async
  {
    emit(ProfileLoadingState());
    final response=await UserService.getProfileInfo();
    if(response is ProfileModel){
      emit(ProfileLoadedState(profile:response));
    }else{
      emit(ProfileErrorState(error: response));
    }
  }
  File?profileImage;
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
      emit(ProfileSelectPhoto());
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
  var fNameController=TextEditingController();
  var lNameController=TextEditingController();
  var birthDateController=TextEditingController();
  var emailController=TextEditingController();
  var phoneNumberController=TextEditingController();
  var locationController=TextEditingController();
  var programmingAgeController=TextEditingController();
  var bioController=TextEditingController();
  var countryController=TextEditingController();
  var specialtyController=TextEditingController();
  var sectionController=TextEditingController();
  var frameworkController=TextEditingController();
  var langController=TextEditingController();

  var studySemesterController=TextEditingController();
  var currentYearController=TextEditingController();
  var studySequenceController=TextEditingController();

  var yearsAsExpertController=TextEditingController();
  var workAtCompanyController=TextEditingController();
  var companiesController=TextEditingController();

  final emailRegex =RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  var editKey=GlobalKey<FormState>();


  updateProfileInfo(context) async
  {
    // isLoading=true;
      emit(ProfileUpdateInfoLoadingPhoto());
      try {
        var data = await UserService.UpdateProfileInfo(
          image: profileImage?.path,
          firstName: fNameController.text,
          lastName: lNameController.text,
          email: emailController.text,
          birthDate: birthDateController.text,
          phoneNumber: phoneNumberController.text,
          bio: bioController.text,
          currentLocation: locationController.text,
          programmingAge: programmingAgeController.text,
          city: countryController.text,
          specialty: specialtyController.text,
          section: sectionController.text,
          language: langController.text,
          frameWork: frameworkController.text,
          study_semester: studySemesterController.text,
          current_year: currentYearController.text,
          study_sequence: studySequenceController.text,
          years_as_expert:yearsAsExpertController.text ,
          work_at_company: workAtCompanyController.text,
          companies: companiesController.text,
          context: context
        );
        if (data != null) {
          emit(ProfileUpdateInfoSuccessPhoto());
          Navigator.pop(context);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Center(
                child: Text(
                    'their is a problem in update'
                ),
              ),
              width: 300.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              backgroundColor: Constants.color,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      } finally {
        // isLoading=false;
        emit(ProfileUpdateInfoDonePhoto());
      }
    }

  getProfilePosts({context,required id}) async {
    emit(ProfilePostsLoadingState());
    //PostModel?post;
    final response = await PostsService.getProfilePosts(id:id);
    if (response is HomeModel) {
      emit(ProfilePostsLoadedState(posts: response));
    } else {
      emit(ProfilePostsErrorState(error: response));
    }
  }

  likePosts({context, required String id}) async {
    emit(ProfileLikePostLoadingState());
    final response = await PostsService.likePost(id: id);
    if (response is bool) {
      emit(ProfileLikePostDoneState(liked: response));
    } else {
      emit(ProfilePostsErrorState(error: response));
    }
  }

  dislikePosts({context, required String id}) async {
    emit(ProfileLikePostLoadingState());
    final response = await PostsService.dislikePost(id: id);
    if (response is bool) {
      emit(ProfileLikePostDoneState(liked: response));
    } else {
      emit(ProfilePostsErrorState(error: response));
    }
  }
  savePost({context, required String id}) async {
    emit(ProfileLikePostLoadingState());
    final response = await PostsService.savePost(id: id);
    if (response is bool) {
      emit(ProfilePostSavedState());
    } else {
      emit(ProfilePostsErrorState(error: response));
    }
  }
  reportPost({context, required String id}) async {
    emit(ProfileLikePostLoadingState());
    final response = await PostsService.reportPost(id: id);
    if (response is bool) {
      emit(ProfilePostReportedState());
    } else {
      emit(ProfilePostsErrorState(error: response));
    }
  }
  }



