import 'package:dev_space/modules/profile_screen/cubit/profile_cubit.dart';
import 'package:dev_space/modules/profile_screen/data_between_pro&edit.dart';
import 'package:dev_space/shared/components/components.dart';
import 'package:dev_space/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          final Data data = ModalRoute.of(context)!.settings.arguments as Data;
          var cubit = ProfileCubit.get(context);
          cubit.fNameController=TextEditingController(text: data.firstName);
          cubit.lNameController=TextEditingController(text: data.lastName);
          cubit.birthDateController=TextEditingController(text: data.birthDate);
          cubit.emailController=TextEditingController(text: data.email);
          cubit.phoneNumberController=TextEditingController(text: data.phoneNumber);
          cubit.locationController=TextEditingController(text: data.currentLocation);
          cubit.programmingAgeController=TextEditingController(text: data.programmingAge);
          cubit.bioController=TextEditingController(text: data.bio);
          cubit.countryController=TextEditingController(text: data.country);
          cubit.specialtyController=TextEditingController(text: data.specialty);
          cubit.sectionController=TextEditingController(text: data.section);
          cubit.frameworkController=TextEditingController(text: data.framework);
          cubit.langController=TextEditingController(text: data.language);
          cubit.studySemesterController=TextEditingController(text: data.studySemester);
          cubit.currentYearController=TextEditingController(text: data.currentYear==null?'':data.currentYear.toString());
          cubit.studySequenceController=TextEditingController(text: data.studySequence);
          cubit.yearsAsExpertController=TextEditingController(text:data.yearsAsExpert==null?'':data.yearsAsExpert.toString());
          cubit.workAtCompanyController=TextEditingController(text: data.workAtCompany);
          cubit.companiesController=TextEditingController(text: data.companies);

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
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions:
              [
                TextButton(
                    onPressed: ()
                    {
                      cubit.updateProfileInfo(context);
                      //print(cubit.phoneNumberController.text);
                    },
                    child: const Text(
                      'Update',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0

                      ),
                    )
                ),
                const SizedBox(
                  width: 5.0,
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: cubit.editKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children:[
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:
                    [
                      if(state is ProfileUpdateInfoLoadingPhoto)
                      const LinearProgressIndicator(
                        color: Constants.color,
                      ),

                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: 54,
                            backgroundColor: Colors.white,
                            child: cubit.profileImage == null && data.photo==null ?
                            const CircleAvatar(
                              radius: 50.0,
                              backgroundColor: Constants.color,
                              backgroundImage: AssetImage(
                                'assets/images/male.png',
                              ),
                            )
                                :cubit.profileImage !=null?CircleAvatar(
                                radius: 50.0,
                                backgroundImage: FileImage(cubit.profileImage!),
                            ):data.photo !=null?CircleAvatar(
                              radius: 50.0,
                              backgroundImage: NetworkImage('${data.photo}'),
                            ):const SizedBox(),

                          ),
                          IconButton(
                              onPressed: () {
                                cubit.showSelectProfilePhotoOptions(context);
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
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children:
                        [
                          Expanded(
                            child: MyFormField(
                                controller: cubit.fNameController,
                                type: TextInputType.name,
                                label: 'First Name',
                                padding: const EdgeInsets.all(
                                    10.0
                                ),
                                prefix: Icons.person_2_outlined,
                                validate: (value)
                                {
                                  return null;
                                }
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: MyFormField(
                                controller: cubit.lNameController,
                                type: TextInputType.name,
                                label: 'Last Name',
                                padding: const EdgeInsets.all(
                                    10.0
                                ),
                                prefix: Icons.person_2_outlined,
                                validate: (value)
                                {
                                  return null;
                                }
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      MyFormField(
                          controller: cubit.birthDateController,
                          label: 'BirthDate',
                          prefix: Icons.date_range_outlined,
                          padding: const EdgeInsets.all(
                              15.0
                          ),
                          readOnly: true,
                          onTap: ()
                          {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            ).then((value){
                              cubit.birthDateController.text=
                                  DateFormat('yyyy-MM-dd').format(value!);
                            });

                          },
                          validate: (value)
                          {
                            return null;
                          }
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      MyFormField(
                          controller: cubit.emailController,
                          type: TextInputType.emailAddress,
                          label: 'Email',
                          prefix: Icons.email_outlined,
                          padding: const EdgeInsets.all(
                              15.0
                          ),
                          validate: (value)
                          {
                            if(!cubit.emailRegex.hasMatch(value!))
                            {
                              return  'Please enter a valid email address';
                            }
                            return null;
                          }
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      MyFormField(
                          controller: cubit.phoneNumberController,
                          label: 'phone number',
                          prefix: Icons.phone_android_outlined,
                          padding: const EdgeInsets.all(
                              15.0
                          ),
                          type:TextInputType.number,
                          format:
                          [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validate: (value)
                          {
                            return null;
                          }
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      MyFormField(
                          controller: cubit.locationController,
                          type:TextInputType.streetAddress,
                          label: 'Your Current Location',
                          prefix: Icons.location_city_outlined,
                          padding: const EdgeInsets.all(
                              15.0
                          ),
                          validate: (value)
                          {
                            return null;
                          }
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      MyFormField(
                        controller: cubit.programmingAgeController,
                        label: 'Your Programming Age',
                        prefix: Icons.real_estate_agent_outlined,
                        padding: const EdgeInsets.all(15.0),
                        readOnly: true,
                        onTap: (){
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          ).then((value){
                            cubit.programmingAgeController.text=
                                DateFormat('yyyy-MM-dd').format(value!);
                          });
                        },
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Programming Age is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      MyFormField(
                        controller:cubit.bioController,
                        type: TextInputType.emailAddress,
                        label: 'Bio',
                        prefix: Icons.access_time,
                        padding: const EdgeInsets.all(
                            15.0
                        ),
                        validate: (value) {
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      MyFormField(
                          controller: cubit.countryController,
                          label: 'where ary you from',
                          prefix: Icons.location_city_outlined,
                          padding: const EdgeInsets.all(
                              15.0
                          ),
                          validate: (value)
                          {
                            return null;
                          }
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      MyFormField(
                          controller: cubit.specialtyController,
                          label: 'Your specialty',
                          prefix: Icons.laptop_outlined,
                          padding: const EdgeInsets.all(
                              15.0
                          ),
                          validate: (value)
                          {
                            return null;
                          }
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      MyFormField(
                          controller: cubit.sectionController,
                          label: 'Your specialty section',
                          prefix: Icons.laptop_outlined,
                          padding: const EdgeInsets.all(
                              15.0
                          ),
                          validate: (value)
                          {
                            return null;
                          }
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      MyFormField(
                          controller: cubit.frameworkController,
                          label: 'Your framework',
                          prefix: Icons.laptop_outlined,
                          padding: const EdgeInsets.all(
                              15.0
                          ),
                          validate: (value)
                          {
                            return null;
                          }
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      MyFormField(
                          controller: cubit.langController,
                          label: 'your languages',
                          prefix: Icons.laptop_outlined,
                          padding: const EdgeInsets.all(
                              15.0
                          ),
                          validate: (value)
                          {
                            return null;
                          }
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      MyFormField(
                          controller: cubit.studySemesterController,
                          label: 'Your study semester',
                          prefix: Icons.school_outlined,
                          padding: const EdgeInsets.all(
                              15.0
                          ),
                          validate: (value)
                          {
                            return null;
                          }
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      MyFormField(
                          controller: cubit.currentYearController,
                          label: 'Current year',
                          prefix: Icons.school_outlined,
                          padding: const EdgeInsets.all(
                              15.0
                          ),
                          validate: (value)
                          {
                            return null;
                          }
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      MyFormField(
                          controller: cubit.studySequenceController,
                          label: 'your study sequence',
                          prefix: Icons.school_outlined,
                          padding: const EdgeInsets.all(
                              15.0
                          ),
                          validate: (value)
                          {
                            return null;
                          }
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      MyFormField(
                          controller: cubit.companiesController,
                          label: 'Companies you worked for them ',
                          prefix: Icons.corporate_fare_outlined,
                          padding: const EdgeInsets.all(
                              15.0
                          ),
                          validate: (value)
                          {
                            return null;
                          }
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      MyFormField(
                          controller: cubit.yearsAsExpertController,
                          label: 'How many years did you worked',
                          prefix: Icons.work_history_outlined,
                          padding: const EdgeInsets.all(
                              15.0
                          ),
                          type:TextInputType.number,
                          format:
                          [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validate: (value)
                          {
                            return null;
                          }
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      MyFormField(
                          controller: cubit.workAtCompanyController,
                          label: 'Your current company',
                          prefix: Icons.nordic_walking_outlined,
                          padding: const EdgeInsets.all(
                              15.0
                          ),
                          validate: (value)
                          {
                            return null;
                          }
                      ),
                    ],
                  ),
                 ]
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
