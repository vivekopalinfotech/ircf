import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';

class FinalExam extends StatefulWidget {
  const FinalExam({super.key});

  @override
  State<FinalExam> createState() => _FinalExamState();
}

class _FinalExamState extends State<FinalExam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteBG,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 45,
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 7,
              child: Row(
                children: [
                  InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        CupertinoIcons.arrow_left,
                        size: 28,
                        color: AppColor.textColor,
                      )),
                  Text(
                    ' Final Exam',
                    style: GoogleFonts.jost(color: AppColor.textColor, fontWeight: FontWeight.w500, fontSize: 21),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Text('1/5',
                style: GoogleFonts.mulish(color: AppColor.textColor, fontWeight: FontWeight.bold, fontSize: 16),)
            )
          ],
        ),
      )])));
  }
}
