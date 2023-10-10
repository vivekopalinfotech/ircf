import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/widgets/title_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteBG,
      body: Padding(
        padding: const EdgeInsets.only(top: 45,bottom: 32,left: AppConstants.HORIZONTAL_PADDING,right: AppConstants.HORIZONTAL_PADDING),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children:   [
    const TitleBar(title: 'Set Your FingerPrint',),

      Padding(padding: const EdgeInsets.only(top: 114,bottom: 80),
        child: SizedBox(
          height: 40,
          child: Text('Add a Fingerprint to Make your Account',style: GoogleFonts.mulish(
              color: AppColor.secondaryTextColor,
              fontSize: AppConstants.SMALL,fontWeight: FontWeight.bold
          ),),
        ),),
    ])),
    );
  }
}
