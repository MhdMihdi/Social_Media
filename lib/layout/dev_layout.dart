import 'package:dev_space/layout/cubit/dev_cubit.dart';
import 'package:dev_space/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class DevLayout extends StatelessWidget {

  const DevLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DevCubit, DevState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit=DevCubit.get(context);
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],

          bottomNavigationBar: Container(
            color: Constants.color,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 15
              ),
              child: GNav(
                gap: 2,
                padding: const EdgeInsets.all(10.0),
                backgroundColor: Constants.color,
                color: Colors.white,
                activeColor: Colors.white,
                tabBackgroundColor: Colors.white30,
                selectedIndex: cubit.currentIndex,
                onTabChange: (index) {
                  cubit.toggleIndex(index);
                },
                tabs: const[
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.group_add,
                    text: 'Friend Request',
                  ),
                  GButton(
                    icon: Icons.group,
                    text: 'Communities',
                  ),
                  GButton(
                    icon: Icons.person,
                    text: 'Profile',
                  ),
                  GButton(
                    icon: Icons.notifications,
                    text: 'Notifications',
                  ),

                ],
                //style: GnavStyle.oldSchool,

              ),
            ),
          ),
        );
      },
    );
  }
}
