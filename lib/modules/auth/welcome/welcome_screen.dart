
import 'package:dev_space/shared/components/components.dart';
import 'package:dev_space/shared/components/constants.dart';
import 'package:dev_space/shared/routes/app_routes.dart';
import 'package:flutter/material.dart';


class WelcomeScreen extends StatelessWidget
{
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration:  const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Container(
              width: 270,
              height: 150,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            MyButton(
              onPressed: ()
              {
                Navigator.pushNamed(
                  context,
                  NamedRoutes.login
                );
              },
              title: 'Login',
              width:250,
              height:50,
              color:  Constants.color,
              radius: 20.0,
              titleColor: Colors.white,
              titleSize:30.0,
            ),
            const SizedBox(
              height: 20.0,
            ),
            MyButton(
              onPressed: ()
              {
                Navigator.pushNamed(
                    context,
                    NamedRoutes.signIn1
                );
              },
              title: 'SignUp',
              width:250,
              height:50,
              color:  Constants.color,
              radius: 20.0,
              titleColor: Colors.white,
              titleSize:30.0,
            ),

          ],
        ),
      ),
    );
  }
}

