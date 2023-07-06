import 'package:dev_space/modules/auth/cubit/auth_cubit.dart';
import 'package:dev_space/shared/components/components.dart';
import 'package:dev_space/shared/components/constants.dart';
import 'package:dev_space/shared/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInScreen extends StatelessWidget
{

  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state)
      {},
      builder: (context, state)
      {
        var cubit=AuthCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              alignment: AlignmentDirectional.topStart,
              children:
              [
                Container(
                  height: 820,
                  decoration:  const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/background.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  child: Form(
                    key:cubit.loginFormKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children:
                          [
                            Container(
                              width: 270,
                              height: 300,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/it.png'),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            MyFormField(
                              controller:cubit.loginEmailController,
                              type: TextInputType.emailAddress,
                              label: 'Email',
                              prefix: Icons.email_outlined,
                              padding: const EdgeInsets.all(
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
                                  return  'Please Enter A Valid Email Address';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            MyFormField(
                              controller:cubit.loginPasswordController,
                              type: TextInputType.text,
                              label: 'Password',
                              prefix: Icons.lock_outline,
                              isPassword: cubit.isPassword,
                              suffix: cubit.isPassword?
                              Icons.remove_red_eye_outlined
                                  :Icons.visibility_off_outlined,
                              suffixFunction: ()
                              {
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
                              },
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),

                            state is AuthLoginLoadingState?
                            const CircularProgressIndicator(
                              color: Constants.color,
                            )
                            :MyButton(
                              onPressed: ()
                              {
                                 cubit.logIn(context);
                              },
                              title: 'Login',
                              width: 300,
                              height: 50,
                              radius: 20.0,
                              color:  Constants.color,
                              titleColor: Colors.white,
                              titleSize: 30.0,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            TextButton(
                                onPressed: ()
                                {
                                  Navigator.pushNamed(
                                      context,
                                      NamedRoutes.resetPass,
                                  );
                                },
                                child: const Text(
                                 'Forget Password ?',
                                  style: TextStyle(
                                      color: Constants.color
                                  ),
                                ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                              [
                                const Text(
                                    'Don\'t Have An Account?',

                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                TextButton(
                                    onPressed: ()
                                    {
                                      Navigator.pushNamed(
                                          context,
                                          NamedRoutes.signIn1
                                      );

                                    },
                                    child: const Text(
                                      'Sign Up Now',
                                      style: TextStyle(
                                        color: Constants.color
                                      ),
                                    ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: IconButton(
                    onPressed: ()
                    {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 35.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
