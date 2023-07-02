import 'package:dev_space/modules/auth/cubit/auth_cubit.dart';
import 'package:dev_space/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit=AuthCubit.get(context);
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
                    'Set up your new password',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                    'Enter new password',
                    style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  MyFormField(
                    controller:cubit.newPass,
                    type: TextInputType.text,
                    label: 'New Password',
                    prefix: Icons.lock,
                    isPassword: cubit.isPassword,
                    suffix: cubit.isPassword?
                    Icons.remove_red_eye_outlined
                        :Icons.visibility_off_outlined,
                    padding: const EdgeInsets.all(
                        15.0
                    ),

                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'password is required';
                      }
                      if(value.length<8)
                      {
                        return 'Password Must Be 8 Character Or More';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  MyFormField(
                    controller: cubit.newPassConfirm,
                    type: TextInputType.text,
                    label: 'Confirm Password',
                    prefix: Icons.lock,
                    isPassword: cubit.isRePassword,
                    suffix: cubit.isRePassword?
                    Icons.remove_red_eye_outlined
                        :Icons.visibility_off_outlined,
                    padding: const EdgeInsets.all(
                        15.0
                    ),

                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Confirm password is required';
                      }
                      if (cubit.newPass !=  cubit.newPassConfirm) {
                        return 'Password not match';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  state is AuthForgotPasswordLoadingState?
                  const Center(
                      child: CircularProgressIndicator(
                        color: Color(0XFF615AAB),
                      )
                  )
                  :Center(
                    child: MyButton(
                      onPressed: ()
                      {
                        //cubit.checkCode(context);
                      },
                      title: 'Reset',
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
