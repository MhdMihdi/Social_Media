import 'package:dev_space/shared/components/components.dart';
import 'package:dev_space/shared/components/constants.dart';
import 'package:dev_space/shared/routes/app_routes.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
        ),
        backgroundColor: Constants.color,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Container(
              height: 190.0,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Align(
                    child: Container(
                      width: double.infinity,
                      height: 140.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        image: const DecorationImage(
                            fit: BoxFit.fill,
                            filterQuality: FilterQuality.medium,
                            image: AssetImage(
                                'assets/images/2.jpg',

                            )
                        ),
                      ),

                    ),
                    alignment: AlignmentDirectional.topCenter,
                  ),
                 CircleAvatar(
                   radius: 54,
                   backgroundColor: Colors.white,
                   child: CircleAvatar(
                     radius: 50.0,
                     backgroundImage: AssetImage(
                       ''
                     ),
                   ),
                 )
                ],
              ),
            ),
            Text(
                'Mohammad Mihdi',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Text(
                'Bio'
            ),
            Row(
              children:
              [
                Expanded(
                  flex: 2,
                  child: MyButton(
                      onPressed: (){},
                      title: 'add story',
                      titleSize: 20.0,
                      titleColor: Colors.white,
                      color: Constants.color,
                      radius: 10.0,
                  ),
                ),
                Expanded(
                  child: MyButton(
                      onPressed: ()
                      {
                         Navigator.pushNamed(
                             context,
                             NamedRoutes.editProfileScreen
                         );
                      },
                      title: 'edit Profile',
                      titleColor: Colors.white,
                      color: Constants.color,
                      radius: 10.0,
                  ),
                ),
              ],
            ),
            MyButton(
              onPressed: (){},
              width: double.infinity,
              title: 'add post',
              titleSize: 25.0,
              titleColor: Colors.white,
              color: Constants.color,
              radius: 10.0,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(
                height: 1,
                color: Colors.grey,
              ),
            ),




          ],
        ),
      ),
    );
  }
}