import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/model/all_listing_response.dart';
import 'package:ircf/model/course_listing_response.dart';
import 'package:ircf/model/course_module_response.dart';
import 'package:ircf/screens/home/detail_tabs.dart';
import 'package:ircf/screens/home/widget/curriculum_list.dart';
import 'package:ircf/screens/my_courses/video_player.dart';
import 'package:ircf/screens/payment/payment.dart';
import 'package:ircf/widgets/title_bar.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Curriculum extends StatefulWidget {
  final type;
  final String amount;
  final List<CourseDetail>? courseDetail;
  final List<CourseModule>? course;
  const Curriculum({super.key, this.type,this.courseDetail, this.course, required this.amount});

  @override
  State<Curriculum> createState() => _CurriculumState();
}

class _CurriculumState extends State<Curriculum> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteBG,
      body: Stack(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 45, left: AppConstants.HORIZONTAL_PADDING, right: AppConstants.HORIZONTAL_PADDING),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const TitleBar(
                  title: 'Curriculum',
                ),
                const SizedBox(
                  height: 18,
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Card(
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        color: Colors.white,
                        child: Padding(
                            padding: const EdgeInsets.all(25),
                            child: ListView.separated(
                              itemCount:    widget.type == 'category'   ?
                              widget.courseDetail!.length:  widget.course!.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(

                                            child: RichText(
                                            textScaleFactor: 1,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            text: TextSpan(text: 'Section ${index+1} - ', style: GoogleFonts.jost(fontSize: 15, fontWeight: FontWeight.w500, color: AppColor.textColor), children: [
                                              TextSpan(
                                                text:   widget.type == 'category'   ? widget.courseDetail![index].crs_name:widget.course![index].main_module!.module_title,
                                                style: GoogleFonts.jost(fontSize: 15, fontWeight: FontWeight.w500, color: AppColor.primaryColor),
                                              )
                                            ]))),
                                        widget.course![index].main_module!.sub_module!=null?

                                        SizedBox():
                                        index== 0?
                                        InkWell(
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: (){
                                              pushNewScreen(context, screen: VideoPlayerScreen(url: widget.course![index].main_module!.sub_module!= null?widget.course![index].main_module!.sub_module![0].course_videos![0].course_video.toString():widget.course![index].main_module!.course_videos![0].course_video.toString(),
                                              title:widget.type == 'category'   ? widget.courseDetail![index].crs_name:widget.course![index].main_module!.module_title,
                                              ),pageTransitionAnimation: PageTransitionAnimation.fade,withNavBar: false);
                                            },
                                            child: SizedBox(
                                                height: 20,width: 20,
                                                child: SvgPicture.asset('assets/images/watch.svg'))): InkWell(
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: (){
                                              //     widget.icon== 'assets/images/lock.svg' ?'':  pushNewScreen(context, screen: VideoPlayerScreen(),pageTransitionAnimation: PageTransitionAnimation.fade,withNavBar: false);
                                            },
                                            child: SizedBox(
                                                height: 20,width: 20,
                                                child: SvgPicture.asset('assets/images/lock.svg'))),
                                      ],
                                    ),
                                    const SizedBox(height: 8,),
                                      ListView.separated(
                                      itemCount:  widget.type == 'category'   ?1: widget.course![index].main_module!.sub_module!=null?widget.course![index].main_module!.sub_module!.length:0,
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index1) {
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
                                                          child: Text(
                                                          '${index1 + 1}',
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
                                                          Text('${widget.course![index].main_module!.sub_module![index1].module_title} ',
                                                            textScaleFactor: 1,
                                                            maxLines: 1,
                                                            overflow: TextOverflow.ellipsis,
                                                            style: GoogleFonts.jost(
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: AppConstants.MEDIUM,
                                                                color: AppColor.textColor
                                                            ),),
                                                          Text('15 mins',
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
                                                 //     widget.icon== 'assets/images/lock.svg' ?'':  pushNewScreen(context, screen: VideoPlayerScreen(),pageTransitionAnimation: PageTransitionAnimation.fade,withNavBar: false);
                                                    },
                                                    child: SizedBox(
                                                        height: 20,width: 20,
                                                        child: SvgPicture.asset('assets/images/lock.svg'))),
                                              )
                                            ],
                                          );

                                      },
                                      separatorBuilder: (BuildContext context, int index) {
                                        return Divider(
                                          color: AppColor.secondaryColor,
                                          height: 48,
                                        );
                                      },
                                    )
                                  ],
                                );
                              },
                              separatorBuilder: (BuildContext context, int index) {
                                return const Divider(
                                  height: 32,
                                );
                              },
                            )),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ))
              ])),
          Positioned(
            bottom: 36,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING),
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  style: ButtonStyle(
                      padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 8)),
                      backgroundColor: MaterialStatePropertyAll<Color>(AppColor.primaryColor),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60),
                        ),
                      )),
                  onPressed: () {
                    pushNewScreen(context, screen: const PaymentMethod(), pageTransitionAnimation: PageTransitionAnimation.fade, withNavBar: false);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 48,
                      ),
                      Center(
                        child: Text(
                          'Enroll Course  ₹ ${widget.amount}',
                          textScaleFactor: 1,
                          style: GoogleFonts.jost(color: Colors.white, fontSize: AppConstants.LARGE, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(60), color: Colors.white),
                          child: Center(
                              child: Icon(
                            CupertinoIcons.arrow_right,
                            size: 30,
                            color: AppColor.primaryColor,
                          )),
                        ),
                      ),
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
