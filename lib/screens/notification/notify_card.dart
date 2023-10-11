import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';

class NotifyCard extends StatefulWidget {
  final icon;
  final title;
  final subTitle;
  final color;
  final iconColor;
  const NotifyCard({super.key, this.icon, this.title, this.subTitle, this.color, this.iconColor});

  @override
  State<NotifyCard> createState() => _NotifyCardState();
}

class _NotifyCardState extends State<NotifyCard> {


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.cardColor
      ),
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 18,vertical: 21),
      margin: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 52,width: 52,
            child: Card(
              color: widget.color,
              shape: CircleBorder(
                side: BorderSide.none
              ),
              child: Center(
                child: SvgPicture.asset(widget.icon,color: widget.iconColor,),
              ),
            ),
          ),
          SizedBox(width: 8,),
          Flexible(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.title,
                textScaleFactor: 1,
                maxLines: 1,overflow: TextOverflow.ellipsis,
                style: GoogleFonts.jost(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,color: AppColor.textColor
                ),),
              Text(
              widget.subTitle,
                textScaleFactor: 1,
                maxLines: 1,overflow: TextOverflow.ellipsis,
                style: GoogleFonts.mulish(
                    fontSize: AppConstants.SMALL,
                    fontWeight: FontWeight.bold,color: AppColor.secondaryTextColor
                ),),
            ],
          ))
        ],
      ),
    );
  }
}
class Notify{
  final icon;
  final title;
  final subTitle;
  final color;
  final iconColor;

  Notify(this.icon, this.title, this.subTitle, this.color, this.iconColor);
}