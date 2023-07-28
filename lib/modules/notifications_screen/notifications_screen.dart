import 'package:dev_space/layout/cubit/dev_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DevCubit, DevState>(
      listener: (context, state) {},
      builder: (context, state) {
        return const Center(
          child: Text(
              'Notifications Screen'
          ),
        );
      },
    );
  }
}