// ignore_for_file: prefer_const_constructors

import 'package:dev_space/modules/auth/cubit/auth_cubit.dart';
import 'package:dev_space/shared/bloc_observer.dart';
import 'package:dev_space/shared/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()
{


  Bloc.observer=MyBlocObserver();

  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(
            create:(context)=>AuthCubit(),
        ),
        BlocProvider(
            create:(context)=>AuthCubit(),
        ),
        // BlocProvider(
        //     create:(context)=>AuthCubit(),
        // ),
      ],
      child: BlocConsumer<AuthCubit,AuthState>(
        listener: (context, state) {},
        builder: (context, state)
        {
          return MaterialApp(
            routes:AppRoutes.routes,
            initialRoute: NamedRoutes.welcome,
            theme: ThemeData(
              useMaterial3: true,
            ),
            //debugShowCheckedModeBanner: false,
            );
        },
      ),
    );
  }
}




