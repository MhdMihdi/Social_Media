import 'package:dev_space/modules/auth/cubit/auth_cubit.dart';
import 'package:dev_space/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state){},
      builder: (context, state) {
        var cubit=AuthCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Verify your email',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0
              ),

            ),
            centerTitle: true,
            backgroundColor: const Color(0XFF615AAB),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft:Radius.circular(40.0) ,
                    bottomRight:Radius.circular(40.0)
                )
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )
            ),
          ),
          body: Form(
            key: cubit.emailVerifyFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 15.0
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  const Text(
                    'Verification code',
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  const Text(
                    'We have sent the code verification to',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  const SizedBox(
                    height: 14.0,
                  ),
                   Text(
                    cubit.forgotPasswordController.text,
                    style: const TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                    [
                      SizedBox(
                        height: 68,
                        width: 44,
                        child: TextFormField(
                          controller: cubit.emailVerifyController1,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          style: Theme.of(context).textTheme.titleLarge,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)
                              )
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 44,
                        child: TextFormField(
                          controller:cubit.emailVerifyController2 ,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          style: Theme.of(context).textTheme.titleLarge,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)
                              )
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 44,
                        child: TextFormField(
                          controller:cubit.emailVerifyController3 ,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          style: Theme.of(context).textTheme.titleLarge,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)
                              )
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 44,
                        child: TextFormField(
                          controller: cubit.emailVerifyController4,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          style: Theme.of(context).textTheme.titleLarge,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)
                              )
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 44,
                        child: TextFormField(
                          controller:cubit.emailVerifyController5 ,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          style: Theme.of(context).textTheme.titleLarge,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)
                              )
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 44,
                        child: TextFormField(
                          controller: cubit.emailVerifyController6,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          style: Theme.of(context).textTheme.titleLarge,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  Row(
                    children:
                    [
                      Expanded(
                        child: MyButton(
                          onPressed: () {},
                          title: 'Resend',
                          titleColor: Colors.white,
                          height: 50.0,
                          color: Colors.grey,
                          //side: Color(0XFF615AAB),
                          radius: 20.0,
                        ),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      Expanded(
                        child: MyButton(
                          onPressed: () {
                            cubit.checkCode(context);
                          },
                          title: 'Confirm',
                          //width: 100,
                          height: 50,
                          titleColor: Colors.white,
                          color: const Color(0XFF615AAB),
                          radius: 20.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      Text('Resend code after'),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '1:30',
                        style: TextStyle(
                            color: Color(0XFF615AAB),
                            fontWeight: FontWeight.bold
                        ),
                      )
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
