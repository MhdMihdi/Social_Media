// ignore_for_file: constant_identifier_names, avoid_print

import 'dart:io';
import 'package:dev_space/database/Services/auth_service.dart';
import 'package:dev_space/shared/components/select_photo_options_screen.dart';
import 'package:dev_space/shared/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


part 'auth_state.dart';

enum Gender{
  Male,
  Female,
}
enum Specialty {
  Software,
  AI,
  CyberSecurity,
  Network,
}

enum Software {
  Frontend,
  Backend,
  MobileDevelopment,
  FullStack,
  DBAnalysis,
  DevOps,
  GamesDevelopment,
  SoftwareAnalysis,
  QualityAssurance,
  CloudArchitecture,
}
enum AI {
  MachineLearning,
  DeepLearning,
  Robotics,
  NaturalLanguageProcessing,
  ExpertSystems,
  FuzzyLogic,
  ComputerVision,
  DataScientist,
  ArtificialGeneralIntelligence,
  NaturalNetwork,
}
enum CyberSecurity{
  NetworkSecurity,
  CloudSecurity,
  EndPointSecurity,
  MobileSecurity,
  IoTSecurity,
  ApplicationSecurity,
  ZeroTrust,
}
enum Network{
  NetworkAdministrators,
  NetworkEngineer,
  NetworkAnalyst,
  SystemsAdministrators,
  NetworkTechnician,
}
enum College {
  CollegeStudent,
  Graduated,
  Masters,
  PhD,
}
enum Languages{
  Dart,
  Php,
  Java,
  Cpp,
  Python,
  JavaScript,
  TypeScript,
  SQL,
  Kotlin,
  Swift,
  Rust,
  MatLab,
  Scala,
}

dynamic Asp='Asp.Net Core';
dynamic Net='.Net Core';

enum FrameWork{
  Flutter,
  ReactJs,
  AngularJs,
  ReactNative,
  Laravel,
  BootStrap,
  Django,
  Asp,
  Net,
  Xamarin,
  jQuery,

}

class AuthCubit extends Cubit<AuthState>
{
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  var formKey = GlobalKey<FormState>();
  var formKey2 = GlobalKey<FormState>();
  var loginFormKey=GlobalKey<FormState>();
  var emailVerifyFormKey=GlobalKey<FormState>();
  var completeInfoFormKey=GlobalKey<FormState>();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var loginEmailController = TextEditingController();
  var passwordController = TextEditingController();
  var loginPasswordController = TextEditingController();
  var rePasswordController = TextEditingController();
  var locationController = TextEditingController();
  var birthDateController = TextEditingController();
  var programmingAgeController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var bioController = TextEditingController();
  var companiesController = TextEditingController();
  var workYearsController = TextEditingController();
  var currentWorkController = TextEditingController();
  bool isPassword = true;
  bool isRePassword=true;
  Gender?gender;
  File?imag;
  final emailRegex=RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  Specialty?specialty;
  College?college;
  var storage=const FlutterSecureStorage();
  bool isLoading=false;
  List<dynamic>selected=[];
  List<dynamic>selectedLang=[];
  List<dynamic>selectedFrame=[];
  String email ='',password ='';


  togglePassword()
  {
    isPassword = !isPassword;
    emit(AuthIsPasswordState());
  }

  toggleRePassword()
  {
    isRePassword = !isRePassword;
    emit(AuthIsPasswordState());
  }

  selectGender(val)
  {
    gender = val;
    emit(AuthSelectGenderState());
  }

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
      emit(AuthSelectPhotoState());
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
  void showSelectPhotoOptions(BuildContext context)
  {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => SingleChildScrollView(
            child: SelectPhotoOptionsScreen(
              onTap: _pickImage,
            ),
          ),
    );
  }
  toggleSpecialty(val)
  {
    specialty=val;
    emit(AuthSelectSpecialtyState());
  }



  selectOption(value,val)
  {
    if(value!)
    {
      selected.add(val);
    }else{
      selected.remove(val);
    }
    emit(AuthSelectOptionState());
  }

  bool selectStudent=false;
  toggleSelectStudent()
  {
    selectStudent =! selectStudent;
    emit(AuthSelectState());
  }

  bool selectWork=false;
  toggleSelectWork()
  {
    selectWork =! selectWork;
    emit(AuthSelectState());
  }

  toggleCollege(val)
  {
    college=val;
    emit(AuthSelectCollegeState());
  }

  signUp(context) async
  {
    bool isValidate=formKey.currentState!.validate();

    if(isValidate)
    {
      // isLoading=true;
      emit(AuthSignUpLoadingState());
      try
      {
        var data=await AuthService.signUp(
          image:imag?.path,firstName: firstNameController.text, lastName: lastNameController.text,
          email: emailController.text, password: passwordController.text,
          birthDate: birthDateController.text, location: locationController.text,
          gender: gender!.name, programmingAge: programmingAgeController.text,
          specialty: specialty!.name, section: selected.join(','),
          language: selectedLang.join(','), frameWork: selectedFrame.join(','),
        );
        if(data!=null)
        {
          emit(AuthSignUpSuccessState());
          await  storage.write(key:"token", value: data.token);
          Navigator.pushNamed(
            context,
            NamedRoutes.emailVerify
          );
        }else
        {
           const SnackBar(
             content:  Text(
              'their this is a problem'
            ),
             width: 100.0,
             backgroundColor: Colors.deepPurple,
            behavior:SnackBarBehavior.floating,
          );
        }
      }finally
      {
        // isLoading=false;

      }
    }
  }
  logIn(context) async
  {
    bool isValidate=loginFormKey.currentState!.validate();

    if(isValidate)
    {
      // isLoading=true;
      emit(AuthLoginLoadingState());
      try
      {
        var data= await AuthService.logIn(
          email: loginEmailController.text,
          password: loginPasswordController.text,
        );
        if(data != null)
        {
          emit(AuthLoginSuccessState());
          await storage.write(key: 'token', value: data.token);
          loginFormKey.currentState!.save();
          Navigator.pushNamed(
            context,
            NamedRoutes.homePage,
          );
        }else
        {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:  const Center(
                  child: Text(
                      'their is a problem in LogIn'
                  ),
                ),
                width: 300.0,
                shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                backgroundColor: Colors.deepPurple,
                behavior:SnackBarBehavior.floating,
              )
          );
        }
      }
      finally
      {
        // isLoading=false;
        emit(AuthLoginDoneState());

        print('ssss');

      }
    }
  }

}



