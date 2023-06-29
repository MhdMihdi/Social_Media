import 'package:dev_space/modules/auth/cubit/auth_cubit.dart';
import 'package:dev_space/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterEmail extends StatelessWidget {
  const EnterEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit =AuthCubit.get(context);
        return Scaffold(
          appBar: AppBar(


            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                )
            ),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 10.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  const Text(
                    'Send verification code',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                      'Enter your email address.',
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  MyFormField(
                    controller: cubit.loginEmailController,
                    type: TextInputType.emailAddress,
                    label: 'Email',
                    prefix: Icons.email_outlined,
                    padding: const EdgeInsets.all(
                        15.0
                    ),
                    onSave: (value) {
                      cubit.email = value!;
                    },
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Email is required';
                      }
                      // if(cubit.emailRegex.hasMatch(value))
                      // {
                      //   return  'Please Enter A Valid Email Address';
                      // }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Center(
                    child: MyButton(
                      onPressed: ()
                      {


                      },
                      title: 'Send',
                      width:500,
                      height:50,
                      color:const Color(0XFF615AAB) ,
                      radius: 20.0,
                      titleColor: Colors.white,
                      titleSize:30.0,
                    ),
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
