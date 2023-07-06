
// ignore_for_file: avoid_print

import 'package:dev_space/modules/auth/cubit/auth_cubit.dart';
import 'package:dev_space/shared/components/components.dart';
import 'package:dev_space/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


class SignUpScreen2 extends StatelessWidget {

  const SignUpScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var cubit = AuthCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Only one step a head',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0
              ),

            ),
            centerTitle: true,
            backgroundColor:  Constants.color,
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
          body: Form(
            key:cubit.formKey2,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 10.0
              ),
              child: Column(
                children:
                [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      const Text(
                        'Your IT Specialty:',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
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
                                      value: Specialty.Software,
                                      groupValue: cubit.specialty,
                                      onChanged: (val)
                                      {
                                        cubit.toggleSpecialty(val);
                                        cubit.selected.clear();
                                        showModalBottomSheet(
                                          context: context,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(20)
                                            ),
                                          ),
                                          builder: (BuildContext context)
                                          {
                                            return Container(
                                                  height: 350,
                                                  padding: const EdgeInsets.all(20),
                                                  child: Stack(
                                                        alignment: AlignmentDirectional.topCenter,
                                                        clipBehavior: Clip.none,
                                                        children:
                                                        [
                                                          Positioned(
                                                            top: -35,
                                                            child: Container(
                                                              width: 50,
                                                              height: 6,
                                                              margin: const EdgeInsets.only(bottom: 20),
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(2.5),
                                                                color: Colors.white,
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 20,
                                                          ),
                                                          ListView.builder(
                                                              itemCount:Software.values.length,
                                                              itemBuilder: (context,index)
                                                              {
                                                                return MyCheckBox(
                                                                        title:Software.values[index].name,
                                                                        value: cubit.selected.contains(Software.values[index].name),
                                                                        onChanged: (value)
                                                                        {
                                                                          cubit.selectOption(
                                                                              value,
                                                                              Software.values[index].name,
                                                                          );
                                                                        },
                                                                );
                                                              },
                                                          ),
                                                        ],
                                                  ),
                                            );
                                          },
                                        ).then((value){
                                          print(cubit.selected);
                                        });
                                      }
                                  ),
                                  Text(
                                    Specialty.Software.name,
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
                                      value: Specialty.AI,
                                      groupValue: cubit.specialty,
                                      onChanged: (val)
                                      {
                                        cubit.toggleSpecialty(val);
                                        cubit.selected.clear();
                                        showModalBottomSheet(
                                          context: context,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(20)
                                            ),
                                          ),
                                          builder: (BuildContext context)
                                          {
                                            return Container(
                                              height: 350,
                                              padding: const EdgeInsets.all(20),
                                              child: Stack(
                                                alignment: AlignmentDirectional.topCenter,
                                                clipBehavior: Clip.none,
                                                children:
                                                [
                                                  Positioned(
                                                    top: -35,
                                                    child: Container(
                                                      width: 50,
                                                      height: 6,
                                                      margin: const EdgeInsets.only(bottom: 20),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(2.5),
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  ListView.builder(
                                                    itemCount:AI.values.length,
                                                    itemBuilder: (context,index)
                                                    {
                                                      return MyCheckBox(
                                                        title:AI.values[index].name,
                                                        value: cubit.selected.contains(AI.values[index].name),
                                                        onChanged: (value)
                                                        {
                                                          cubit.selectOption(
                                                            value,
                                                            AI.values[index].name,
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ).then((value){
                                          print(cubit.selected);
                                        });
                                      }
                                  ),
                                  Text(
                                      Specialty.AI.name,
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
                        height: 20.0,
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
                                        value: Specialty.CyberSecurity,
                                        groupValue: cubit.specialty,
                                        onChanged: (val)
                                        {
                                          cubit.toggleSpecialty(val);
                                          cubit.selected.clear();
                                          showModalBottomSheet(
                                            context: context,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.vertical(
                                                  top: Radius.circular(20)
                                              ),
                                            ),
                                            builder: (BuildContext context)
                                            {
                                              return Container(
                                                height: 350,
                                                padding: const EdgeInsets.all(20),
                                                child: Stack(
                                                  alignment: AlignmentDirectional.topCenter,
                                                  clipBehavior: Clip.none,
                                                  children:
                                                  [
                                                    Positioned(
                                                      top: -35,
                                                      child: Container(
                                                        width: 50,
                                                        height: 6,
                                                        margin: const EdgeInsets.only(bottom: 20),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(2.5),
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    ListView.builder(
                                                      itemCount:CyberSecurity.values.length,
                                                      itemBuilder: (context,index)
                                                      {
                                                        return MyCheckBox(
                                                          title:CyberSecurity.values[index].name,
                                                          value: cubit.selected.contains(CyberSecurity.values[index].name),
                                                          onChanged: (value)
                                                          {
                                                            cubit.selectOption(
                                                              value,
                                                              CyberSecurity.values[index].name,
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ).then((value){
                                            print(cubit.selected);
                                          });
                                        }
                                    ),
                                    Text(
                                      Specialty.CyberSecurity.name,
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
                                      value: Specialty.Network,
                                      groupValue: cubit.specialty,
                                      onChanged: (val)
                                      {
                                        cubit.toggleSpecialty(val);
                                        cubit.selected.clear();
                                        showModalBottomSheet(
                                          context: context,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(20)
                                            ),
                                          ),
                                          builder: (BuildContext context)
                                          {
                                            return Container(
                                              height: 350,
                                              padding: const EdgeInsets.all(20),
                                              child: Stack(
                                                alignment: AlignmentDirectional.topCenter,
                                                clipBehavior: Clip.none,
                                                children:
                                                [
                                                  Positioned(
                                                    top: -35,
                                                    child: Container(
                                                      width: 50,
                                                      height: 6,
                                                      margin: const EdgeInsets.only(bottom: 20),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(2.5),
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  ListView.builder(
                                                    itemCount:Network.values.length,
                                                    itemBuilder: (context,index)
                                                    {
                                                      return MyCheckBox(
                                                        title:Network.values[index].name,
                                                        value: cubit.selected.contains(Network.values[index].name),
                                                        onChanged: (value)
                                                        {
                                                          cubit.selectOption(
                                                            value,
                                                            Network.values[index].name,
                                                          );
                                                        },
                                                      );
                                                    },

                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ).then((value){
                                          print(cubit.selected);
                                        });
                                      }
                                  ),
                                  Text(
                                    Specialty.Network.name,
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
                        height:15.0 ,
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
                          controller: cubit.languagesController,
                          label: 'Your Languages',
                          prefix: Icons.code,
                          readOnly: true,
                          padding: const EdgeInsets.all(
                              15.0
                          ),
                          onTap: ()
                          {
                            showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)
                                ),
                              ),
                              builder: (BuildContext context)
                              {
                                return Container(
                                  height: 350,
                                  padding: const EdgeInsets.all(20),
                                  child: Stack(
                                    alignment: AlignmentDirectional.topCenter,
                                    clipBehavior: Clip.none,
                                    children:
                                    [
                                      Positioned(
                                        top: -35,
                                        child: Container(
                                          width: 50,
                                          height: 6,
                                          margin: const EdgeInsets.only(bottom: 20),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(2.5),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      ListView.builder(
                                        itemCount:Languages.values.length,
                                        itemBuilder: (context,index)
                                        {
                                          return MyCheckBox(
                                            title:Languages.values[index].name,
                                            value: cubit.selectedLang.contains(Languages.values[index].name),
                                            onChanged: (value)
                                            {
                                              cubit.selectLan(
                                                value,
                                                Languages.values[index].name,
                                              );

                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ).then((value){
                              print(cubit.selectedLang);
                              cubit.languagesController.text=cubit.selectedLang.join(',');
                            });

                          },
                          validate: (value)
                          {
                            if (value!.isEmpty) {
                              return 'Languages is required';
                            }
                            return null;
                          }
                      ),
                      const SizedBox(
                        height:15.0 ,
                      ),
                      MyFormField(
                          controller: cubit.frameWorkController,
                          label: 'Your frameWork',
                          prefix: Icons.code,
                          readOnly: true,
                          padding: const EdgeInsets.all(
                              15.0
                          ),
                          onTap: ()
                          {
                            showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)
                                ),
                              ),
                              builder: (BuildContext context)
                              {
                                return Container(
                                  height: 350,
                                  padding: const EdgeInsets.all(20),
                                  child: Stack(
                                    alignment: AlignmentDirectional.topCenter,
                                    clipBehavior: Clip.none,
                                    children:
                                    [
                                      Positioned(
                                        top: -35,
                                        child: Container(
                                          width: 50,
                                          height: 6,
                                          margin: const EdgeInsets.only(bottom: 20),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(2.5),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      ListView.builder(
                                        itemCount:FrameWork.values.length,
                                        itemBuilder: (context,index)
                                        {
                                          return MyCheckBox(
                                            title:FrameWork.values[index].name,
                                            value: cubit.selectedFrame.contains(FrameWork.values[index].name),
                                            onChanged: (value)
                                            {
                                              cubit.selectFrame(
                                                value,
                                                FrameWork.values[index].name,
                                              );

                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ).then((value){
                              print(cubit.selectedFrame);
                              cubit.frameWorkController.text=cubit.selectedFrame.join(',');
                            });

                          },
                          validate: (value)
                          {
                            if (value!.isEmpty) {
                              return 'framework is required';
                            }
                            return null;
                          }
                      ),
                      const SizedBox(
                        height:15.0 ,
                      ),
                      state is AuthSignUpLoadingState?
                      const Center(
                        child: CircularProgressIndicator(
                          color: Constants.color,
                        ),
                      )
                        :Center(
                          child: MyButton(
                          onPressed: ()
                          {
                            cubit.signUp(context);
                            // Navigator.pushNamed(
                            //   context,
                            //   NamedRoutes.completeInfo
                            // );
                          },
                          title: 'Sign Up',
                          width:250,
                          height:50,
                          color: Constants.color ,
                          radius: 20.0,
                          titleColor: Colors.white,
                          titleSize:30.0,
                      ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
