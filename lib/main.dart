// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, unrelated_type_equality_checks





import 'package:flutter/material.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/main_screen.dart';
import 'package:ircf/screens/login/onboarding_screen.dart';

Future<void> main() async {

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

   return MaterialApp(
              title: 'Vkind',
              debugShowCheckedModeBanner: false,
              /* light theme settings */
              theme: ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.blue,
                textSelectionTheme: TextSelectionThemeData(cursorColor: AppColor.primaryColor),
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                primarySwatch: Colors.blue,
                textSelectionTheme: TextSelectionThemeData(cursorColor: AppColor.primaryColor),
                backgroundColor: Colors.black
                ,
              ),
              themeMode: ThemeMode.system,
              home:
              //const OnboardingScreen()
     const MainScreen(redirectPageName: 'home')

          );

  }
}
