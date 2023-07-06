import 'package:dev_space/modules/auth/cubit/auth_cubit.dart';
import 'package:dev_space/shared/components/components.dart';
import 'package:dev_space/shared/components/constants.dart';
import 'package:dev_space/shared/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompleteInformation extends StatelessWidget
{

  const CompleteInformation({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit =AuthCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Complete your information',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0
              ),
            ),
            centerTitle: true,
            backgroundColor:Constants.color,
            shape:const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft:Radius.circular(40.0) ,
                bottomRight:Radius.circular(40.0)
              )
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: ()
              {
                Navigator.pop(context);
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Form(
              key:cubit.completeInfoFormKey ,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child:Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 10.0
                ),
                child: Column(
                  children:
                  [
                    MyCheckBox(
                      title: 'Are you a student?',
                      value: cubit.selectStudent,
                      color: Colors.deepPurple.shade100,
                      radius: 20.0,
                      onChanged: (val)
                      {
                        cubit.toggleSelectStudent();
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    cubit.selectStudent==true?
                    Column(
                      children: [
                        Row(
                          children:
                          [
                            Expanded(
                                child: Container(
                                  width: 25.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple.shade100,
                                      borderRadius: BorderRadius.circular(20.0)
                                  ),
                                  child: Row(
                                    children:
                                    [
                                      Radio(
                                          value: College.UnderGraduate,
                                          groupValue: cubit.college,
                                          onChanged: (val)
                                          {
                                            cubit.toggleCollege(val);
                                          }
                                      ),
                                      Text(
                                        College.UnderGraduate.name,
                                        style: const TextStyle(
                                            fontSize: 15.0
                                        ),
                                      )
                                    ],
                                  ),
                                )
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: Container(
                                width: 25.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple.shade100,
                                    borderRadius: BorderRadius.circular(20.0)
                                ),
                                child: Row(
                                  children:
                                  [
                                    Radio(
                                        value: College.Graduated,
                                        groupValue: cubit.college,
                                        onChanged: (val)
                                        {
                                          cubit.toggleCollege(val);
                                        }
                                    ),
                                    Text(
                                      College.Graduated.name,
                                      style: const TextStyle(
                                          fontSize: 16.0
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          children:
                          [
                            Expanded(
                                child: Container(
                                  width: 25.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple.shade100,
                                      borderRadius: BorderRadius.circular(20.0)
                                  ),
                                  child: Row(
                                    children:
                                    [
                                      Radio(
                                          value: College.Masters,
                                          groupValue: cubit.college,
                                          onChanged: (val)
                                          {
                                            cubit.toggleCollege(val);
                                          }
                                      ),
                                      Text(
                                        College.Masters.name,
                                        style: const TextStyle(
                                            fontSize: 16.0
                                        ),
                                      )
                                    ],
                                  ),
                                )
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: Container(
                                width: 25.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple.shade100,
                                    borderRadius: BorderRadius.circular(20.0)
                                ),
                                child: Row(
                                  children:
                                  [
                                    Radio(
                                        value: College.PhD,
                                        groupValue: cubit.college,
                                        onChanged: (val)
                                        {
                                          cubit.toggleCollege(val);
                                        }
                                    ),
                                    Text(
                                      College.PhD.name,
                                      style: const TextStyle(
                                          fontSize: 16.0
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
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
                            type:TextInputType.number,
                            format:
                            [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            validate: (value)
                            {
                              if(value!.isEmpty)
                              {
                                return 'Current year is required';
                              }
                              return null;
                            }
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        MyFormField(
                            controller: cubit.sectionController,
                            label: 'which Section you study',
                            prefix: Icons.school_outlined,
                            padding: const EdgeInsets.all(
                                15.0
                            ),
                            validate: (value)
                            {
                              if(value!.isEmpty)
                              {
                                return 'Section is required';
                              }
                              return null;
                            }
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        MyFormField(
                            controller: cubit.studySequenceController,
                            label: 'Your study sequence',
                            prefix: Icons.school_outlined,
                            padding: const EdgeInsets.all(
                                15.0
                            ),
                            validate: (value)
                            {
                              if(value!.isEmpty)
                              {
                                return 'sequence is required';
                              }
                              return null;
                            }
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          width:300,
                          height:3,
                          color:Colors.grey
                        ),
                      ],
                    )
                        :const SizedBox(),
                    cubit.selectStudent==true?
                    const SizedBox(height: 15.0,)
                        :const SizedBox(),
                    MyCheckBox(
                      title: 'Do you work now or before?',
                      value: cubit.selectWork,
                      color: Colors.deepPurple.shade100,
                      radius: 20.0,
                      onChanged: (val)
                      {
                        cubit.toggleSelectWork();
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    cubit.selectWork==true?
                        Column(
                          children:
                          [
                            MyFormField(
                                controller: cubit.companiesController,
                                label: 'Companies you worked for them ',
                                prefix: Icons.corporate_fare_outlined,
                                padding: const EdgeInsets.all(
                                    15.0
                                ),
                                validate: (value)
                                {
                                  if(value!.isEmpty)
                                  {
                                    return 'Companies is required';
                                  }
                                  return null;
                                }
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            MyFormField(
                                controller: cubit.workYearsController,
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
                                  if(value!.isEmpty)
                                  {
                                    return 'years is required';
                                  }
                                  return null;
                                }
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            MyFormField(
                                controller: cubit.currentWorkController,
                                label: 'Your current company',
                                prefix: Icons.nordic_walking_outlined,
                                padding: const EdgeInsets.all(
                                    15.0
                                ),
                                validate: (value)
                                {
                                  if(value!.isEmpty)
                                  {
                                    return 'current company is required';
                                  }
                                  return null;
                                }
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Container(
                                width:300,
                                height:3,
                                color:Colors.grey
                            ),
                          ],
                        )
                        :const SizedBox(),
                    cubit.selectWork==true?
                    const SizedBox(height: 15.0,)
                        :const SizedBox(),
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
                          if(value!.isEmpty)
                          {
                            return 'phone number is required';
                          }
                          return null;
                        }
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    MyFormField(
                        controller: cubit.bioController,
                        label: 'Bio',
                        prefix: Icons.person_pin_outlined,

                        padding: const EdgeInsets.all(
                            15.0
                        ),
                        validate: (value)
                        {
                          if(value!.isEmpty)
                          {
                            return 'Bio is required';
                          }
                          return null;
                        }
                    ),
                    const SizedBox(
                      height: 20.0,
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
                          if(value!.isEmpty)
                          {
                            return 'this field is required';
                          }
                          return null;
                        }
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      [
                        state is AuthCompleteInfoLoadingState?
                        const SizedBox()
                        :Expanded(
                          child: MyButton(
                            onPressed: ()
                            {
                              Navigator.pushNamed(
                                context,
                                NamedRoutes.homePage
                              );
                            },
                            title: 'Skip',
                            titleSize: 20.0,
                            side: Constants.color,
                            titleColor: Colors.white,
                            height: 50.0,
                            color:Colors.grey,
                            radius: 20.0,
                          ),
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        state is AuthCompleteInfoLoadingState?
                          const CircularProgressIndicator(
                            color: Constants.color,
                          )
                        :Expanded(
                          child: MyButton(
                            onPressed: ()
                            {
                              cubit.completeInfo(context);
                            },
                            title: 'Done',
                            titleSize: 20.0,
                            height: 50,
                            titleColor: Colors.white,
                            color: Constants.color,
                            radius: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ),
          ),
        );
      },
    );
  }
}
