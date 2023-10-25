import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/screens/my_courses/video_player.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class CurriculumList extends StatefulWidget {
  final number;
  final chapter;
  final time;
  final icon;
  const CurriculumList({super.key, this.number, this.chapter, this.time, this.icon});

  @override
  State<CurriculumList> createState() => _CurriculumListState();
}

class _CurriculumListState extends State<CurriculumList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 4,
          child: Row(
            children: [
              Flexible(
                flex:1,
                child: Container(
                  height: 46,width: 46,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColor.cardColor
                  ),
                  child: Center(
                    child: Text(widget.number.toString(),
                      style: GoogleFonts.jost(
                          fontWeight: FontWeight.w500,
                          fontSize: AppConstants.SMALL,
                          color: AppColor.textColor
                      ),),
                  ),
                ),
              ),
              const SizedBox(width: 12,),
              Flexible(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${widget.chapter} ',
                      textScaleFactor: 1,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.jost(
                          fontWeight: FontWeight.w500,
                          fontSize: AppConstants.MEDIUM,
                          color: AppColor.textColor
                      ),),
                    Text(widget.time,
                      textScaleFactor: 1,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.mulish(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: AppColor.secondaryTextColor
                      ),),
                  ],
                ),
              )
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: InkWell(
            splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: (){
                widget.icon== 'assets/images/lock.svg' ?'':  pushNewScreen(context, screen: VideoPlayerScreen(url: '',),pageTransitionAnimation: PageTransitionAnimation.fade,withNavBar: false);
              },
              child: SizedBox(
                  height: 20,width: 20,
                  child: SvgPicture.asset(widget.icon))),
        )
      ],
    );
  }
}
