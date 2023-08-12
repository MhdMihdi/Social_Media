// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, constant_identifier_names, must_be_immutable

import 'package:dev_space/modules/auth/cubit/auth_cubit.dart';
import 'package:dev_space/shared/components/components.dart';
import 'package:dev_space/shared/components/constants.dart';
import 'package:dev_space/shared/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SignUpScreen1 extends StatelessWidget {

  const SignUpScreen1({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var cubit=AuthCubit.get(context);
        return Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: cubit.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children:
                  [
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
                              cubit.showSelectPhotoOptions(context);
                            },
                            child: Stack(
                              alignment: AlignmentDirectional.bottomEnd,

                              children:
                              [
                                CircleAvatar(
                                  radius: 63.0,
                                  backgroundColor: Colors.white,
                                  child: cubit.imag==null?
                                   CircleAvatar(
                                    radius: 60.0,
                                    backgroundColor: Constants.color,
                                    backgroundImage: AssetImage(
                                      'assets/images/male.png',
                                    ),
                                  )
                                  :CircleAvatar(
                                    radius: 60.0,
                                    backgroundImage: FileImage(cubit.imag!),
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
                    const SizedBox(
                      height: 60.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children:
                        [
                          Row(
                            children:
                            [
                              Expanded(
                                child: MyFormField(
                                    controller: cubit.firstNameController,
                                    type: TextInputType.name,
                                    label: 'First Name',
                                    padding: EdgeInsets.all(
                                        10.0
                                    ),
                                    prefix: Icons.person_2_outlined,
                                    validate: (value)
                                    {
                                     if(value!.isEmpty)
                                     {
                                       return 'First Name is required';
                                     }
                                     return null;
                                    }
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: MyFormField(
                                    controller: cubit.lastNameController,
                                    type: TextInputType.name,
                                    label: 'Last Name',
                                    padding: EdgeInsets.all(
                                        10.0
                                    ),
                                    prefix: Icons.person_2_outlined,
                                    validate: (value)
                                    {
                                      if(value!.isEmpty)
                                      {
                                        return 'Last Name is required';
                                      }
                                      return null;
                                    }
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          MyFormField(
                              controller: cubit.emailController,
                              type: TextInputType.emailAddress,
                              label: 'Email',
                              prefix: Icons.email_outlined,
                              padding: EdgeInsets.all(
                                  15.0
                              ),
                              validate: (value)
                              {
                                if(value!.isEmpty)
                                {
                                  return 'Email is required';
                                }
                                if(!cubit.emailRegex.hasMatch(value))
                                {
                                  return  'Please enter a valid email address';
                                }
                                return null;
                              }
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          MyFormField(
                              controller: cubit.passwordController,
                              type: TextInputType.text,
                              label: 'Password',
                              prefix: Icons.lock_outline,
                              isPassword: cubit.isPassword,
                              suffix: cubit.isPassword?Icons.remove_red_eye_outlined:Icons.visibility_off_outlined,
                              suffixFunction: (){
                                cubit.togglePassword();
                              },
                              padding: const EdgeInsets.all(
                                  15.0
                              ),
                              validate: (value)
                              {
                                if(value!.isEmpty)
                                {
                                  return 'Password is required';
                                }
                                if(value.length<8)
                                {
                                  return 'Password Must Be 4 Character Or More';
                                }
                                return null;
                              }
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          MyFormField(
                              controller: cubit.rePasswordController,
                              type: TextInputType.text,
                              label: 'Confirm Password',
                              prefix: Icons.lock_outline,
                              isPassword: cubit.isRePassword,
                              suffix: cubit.isRePassword?Icons.remove_red_eye_outlined:Icons.visibility_off_outlined,
                              suffixFunction: (){
                                cubit.toggleRePassword();
                              },
                              padding: const EdgeInsets.all(
                                  15.0
                              ),
                              validate: (value)
                              {
                                if(value!.isEmpty)
                                {
                                  return 'Password is required';
                                }

                                if(cubit.passwordController.text != cubit.rePasswordController.text)
                                {
                                  return 'Password Does Not Match';
                                }
                                return null;
                              }
                          ),
                          const SizedBox(
                            height: 10.0,
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
                                if(value!.isEmpty)
                                {
                                  return 'BirthDate is required';
                                }
                                return null;

                              }
                          ),
                          const SizedBox(
                            height: 10,
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
                                if(value!.isEmpty)
                                {
                                  return 'Your current location is required';
                                }
                                return null;
                              }
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children:
                            [
                              Expanded(
                                child: MyRadioButton(
                                    //visual: VisualDensity.comfortable,
                                    title: Gender.Male.name,
                                    padding: const EdgeInsets.all(0.0),
                                    color: Colors.deepPurple.shade100,
                                    radius: 20.0,
                                    value: Gender.Male,
                                    groupValue: cubit.gender,
                                    onChanged: (val)
                                    {
                                      cubit.selectGender(val);
                                    }
                                ),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Expanded(
                                child: MyRadioButton(
                                    //visual: VisualDensity.comfortable,
                                    title: Gender.Female.name,
                                    padding: const EdgeInsets.all(0.0),
                                    color: Colors.deepPurple.shade100,
                                    radius: 20.0,
                                    value: Gender.Female,
                                    groupValue: cubit.gender,
                                    onChanged: (val)
                                    {
                                      cubit.selectGender(val);
                                    }
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          MyButton(
                             onPressed: ()
                             {
                               if(cubit.formKey.currentState!.validate())
                               {
                                 if(cubit.gender != null) {
                                   Navigator.pushNamed(
                                       context,
                                       NamedRoutes.signIn2,
                                       arguments: (
                                       cubit.formKey.currentState!.validate(),
                                       cubit.imag?.path,
                                       cubit.firstNameController.text,
                                       cubit.lastNameController.text,
                                       cubit.emailController.text,
                                       cubit.passwordController.text,
                                       cubit.rePasswordController.text,
                                       cubit.birthDateController.text,
                                       cubit.locationController.text,
                                       cubit.gender!.name,
                                       )
                                   );
                                 }
                               }
                               if(cubit.gender==null)
                               {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Center(
                                          child: Text(
                                            'Please Select a Gender',
                                            style: TextStyle(
                                              fontSize: 20.0
                                            ),
                                          ),
                                      ),
                                      backgroundColor: Constants.color,
                                    ),
                                  );
                               }
                              // Navigator.pushNamed(
                              //   context,
                              //   NamedRoutes.signIn2
                              // );
                             },
                             title: 'Next',
                             width:250,
                             height:50,
                             color:Constants.color ,
                             radius: 20.0,
                             titleColor: Colors.white,
                             titleSize:30.0,
                         ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
        );
      },
    );
  }
}
