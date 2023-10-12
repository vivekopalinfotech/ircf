// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';

class WidgetList extends StatefulWidget {
  const WidgetList({super.key});

  @override
  State<WidgetList> createState() => _WidgetListState();
}

class _WidgetListState extends State<WidgetList> {

  List<Items> items = [
    Items('assets/images/Lessons.svg', '25 Lessons'),
    Items('assets/images/Mobile.svg', 'Access Mobile, Desktop & TV'),
    Items('assets/images/Level.svg', 'Beginner Level'),
    Items('assets/images/Audio_book.svg', 'Audio Book'),
    Items('assets/images/handicapped.svg', 'Lifetime Access'),
    Items('assets/images/writing.svg', '100 Quizzes'),
    Items('assets/images/book.svg', 'Certificate of Completion'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                SvgPicture.asset(items[index].icon),
                Text('  ${items[index].title}',
                textScaleFactor: 1,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.mulish(
                  fontSize: AppConstants.SMALL,
                  fontWeight: FontWeight.bold,
                  color: AppColor.secondaryTextColor
                ),
                )
              ],
            ),
          );
    });
  }
}

class Items{
  final icon;
  final title;

  Items(this.icon, this.title);
}