// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/cubit/all_listings/all_listings_cubit.dart';
import 'package:ircf/cubit/check_mobile/check_mobile_cubit.dart';
import 'package:ircf/cubit/course_category/course_category_cubit.dart';
import 'package:ircf/cubit/course_listing/course_listing_cubit.dart';
import 'package:ircf/cubit/course_module/course_module_cubit.dart';
import 'package:ircf/cubit/login/login_cubit.dart';
import 'package:ircf/cubit/register/register_cubit.dart';
import 'package:ircf/main_screen.dart';
import 'package:ircf/screens/login/onboarding_screen.dart';
import 'package:ircf/service/repo/ircf_repository.dart';
import 'package:sizer/sizer.dart';

String token = "";
String login = "";

Future<void> main() async {

  runApp(const MyApp());
  print(login);
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
           create: (context) => RegisterCubit(repository),
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
         BlocProvider(
           create: (context) => AllListingCubit(repository),
         ),
         BlocProvider(
           create: (context) => LoginCubit(repository),
         ),
       ],
       child: Sizer(builder: (context, orientation, deviceType) {
         return MaterialApp(
             title: 'Vkind',
             debugShowCheckedModeBanner: false,
             theme: ThemeData(
               brightness: Brightness.light,
               primarySwatch: Colors.blue,
               textSelectionTheme: TextSelectionThemeData(cursorColor: AppColor.primaryColor),
             ),
             themeMode: ThemeMode.system,
             home: login == "true"
                 ? const MainScreen(
               redirectPageName: "home",
             )
                 : const OnboardingScreen()
         );
       }));

  }
}
