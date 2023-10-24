import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/model/all_listing_response.dart';
import 'package:ircf/model/course_listing_response.dart';
import 'package:ircf/model/course_module_response.dart';
import 'package:ircf/screens/home/detail_tabs.dart';
import 'package:ircf/screens/home/widget/curriculum_list.dart';
import 'package:ircf/screens/payment/payment.dart';
import 'package:ircf/widgets/title_bar.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Curriculum extends StatefulWidget {
  final type;
  final List<CourseModule>? courseModule;
  final List<CourseDetail>? courseDetail;
  final List<Course>? course;
  const Curriculum({super.key, this.type, required this.courseModule, this.courseDetail, this.course});

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
                              widget.courseDetail!.length:  widget.type == 'all'   ?widget.course!.length:widget.courseModule!.length,
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
                                                text:   widget.type == 'category'   ? widget.courseDetail![index].crs_name:widget.type == 'all'   ?widget.course![index].crs_name:widget.courseModule![index].main_module!.module_title,
                                                style: GoogleFonts.jost(fontSize: 15, fontWeight: FontWeight.w500, color: AppColor.primaryColor),
                                              )
                                            ]))),
                                        Text(
                                          '25 Mins',
                                          style: GoogleFonts.mulish(fontSize: 12, fontWeight: FontWeight.bold, color: AppColor.primaryColor),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 8,),
                                    ListView.separated(
                                      itemCount:  widget.type == 'category'   ?1:widget.type == 'all'   ?1:widget.courseModule![index].main_module!.course_videos!.length,
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return CurriculumList(
                                          number: index+1,
                                          chapter: 'Chapter - ${index+1}',
                                          time: '25 mins',
                                          icon: 'assets/images/watch.svg',
                                        );
                                      },
                                      separatorBuilder: (BuildContext context, int index) {
                                        return Divider(
                                          color: AppColor.secondaryColor,
                                          height: 48,
                                        );
                                      },
                                    ),
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
                          'Enroll Course - \$${55}',
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
