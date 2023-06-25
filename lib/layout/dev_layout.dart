import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class DevLayout extends StatelessWidget {

  const DevLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: const Center(
        child:Text(
            'HomeScreen'
        ),
      ),
      bottomNavigationBar:Container(
        color:const Color(0XFF615AAB) ,
        child:  Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 15
          ),
          child: GNav(
            gap: 8,
            padding:const EdgeInsets.all(16.0),
            backgroundColor: const Color(0XFF615AAB),
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.white30,
            onTabChange: (index)
            {
              print(index);
            },
            tabs: const [
                GButton(
                    icon:Icons.home,
                    text: 'Home',
                ),
                GButton(
                    icon:Icons.group_add,
                    text: 'Friend Request',
                ),
                GButton(
                    icon:Icons.group,
                    text: 'Communities',
                ),
                GButton(
                    icon:Icons.person,
                    text: 'Profile',
                ),
                GButton(
                    icon:Icons.notifications,
                    text: 'Notifications',
                ),
                GButton(
                    icon:Icons.settings,
                    text: 'Settings',
                ),
              ],
           //style: GnavStyle.oldSchool,

          ),
        ),
      ),
    );
  }
}