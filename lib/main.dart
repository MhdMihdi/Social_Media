// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:dev_space/layout/cubit/dev_cubit.dart';
import 'package:dev_space/modules/auth/cubit/auth_cubit.dart';
import 'package:dev_space/modules/drawer/createPage.dart';
import 'package:dev_space/shared/bloc_observer.dart';
import 'package:dev_space/shared/network/local/cache_helper.dart';
import 'package:dev_space/shared/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()async
{

  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();
  String? token='1|FzmLnuWIJjKm1N4zeu8cv6oQlvanM00QChRHrX8Y'; //await CacheHelper.getData(key: 'token');
  debugPrint(token);

  Bloc.observer=MyBlocObserver();


  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget
{
  String?token;
   MyApp({super.key,this.token});

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
            create:(context)=>DevCubit(),
        ),
      ],
      child: BlocConsumer<DevCubit,DevState>(
        listener: (context, state) {},
        builder: (context, state)
        {
          return MaterialApp(
            routes:AppRoutes.routes,
            initialRoute: token==null?NamedRoutes.welcome: NamedRoutes.homePage,
            theme: ThemeData(
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            );
        },
      ),
    );
  }
}




