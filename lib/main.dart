// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/cubit/check_mobile/check_mobile_cubit.dart';
import 'package:ircf/cubit/course_category/course_category_cubit.dart';
import 'package:ircf/cubit/course_listing/course_listing_cubit.dart';
import 'package:ircf/cubit/course_module/course_module_cubit.dart';
import 'package:ircf/cubit/login/login_cubit.dart';
import 'package:ircf/main_screen.dart';
import 'package:ircf/screens/login/onboarding_screen.dart';
import 'package:ircf/service/repo/ircf_repository.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    final repository = IrcfRepository();
   return MultiBlocProvider(
       providers: [
         BlocProvider(
           create: (context) => CourseModuleCubit(repository),
         ),
         BlocProvider(
           create: (context) => LoginCubit(repository),
         ),
         BlocProvider(
           create: (context) => CourseCategoryCubit(repository),
         ),
         BlocProvider(
           create: (context) => MobileCubit(repository),
         ),
         BlocProvider(
           create: (context) => CourseListingCubit(repository),
         ),
       ],
       child: Sizer(builder: (context, orientation, deviceType) {
         return MaterialApp(
             title: 'Vkind',
             debugShowCheckedModeBanner: false,
             /* light theme settings */
             theme: ThemeData(
               brightness: Brightness.light,
               primarySwatch: Colors.blue,
               textSelectionTheme: TextSelectionThemeData(cursorColor: AppColor.primaryColor),
             ),

             themeMode: ThemeMode.system,
             home: OnboardingScreen()
         );
       }));

  }
}
