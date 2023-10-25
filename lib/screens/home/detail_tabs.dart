import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/model/all_listing_response.dart';
import 'package:ircf/model/course_listing_response.dart';
import 'package:ircf/model/course_module_response.dart';
import 'package:ircf/screens/home/curriculum.dart';
import 'package:ircf/screens/home/widget/curriculum_list.dart';
import 'package:ircf/screens/my_courses/video_player.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:readmore/readmore.dart';

class DetailTabs extends StatefulWidget {
  final controller;
  final type;
  final desc;
  final amount;

  final List<CourseDetail>? courseDetail;
  final List<CourseModule>? course;
  const DetailTabs({super.key, this.controller, this.courseDetail, this.type, this.course, this.desc, this.amount});

  @override
  State<DetailTabs> createState() => _DetailTabsState();
}

class _DetailTabsState extends State<DetailTabs> {
  

  List<Curriculcum> item = [
    Curriculcum('01', 'Chapter - 1', '15 Mins'),
    Curriculcum('02', 'Chapter - 2', '10 Mins'),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: widget.controller,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
                color: AppColor.whiteBG
            ),
            labelPadding: EdgeInsets.zero,
            padding: const EdgeInsets.symmetric(vertical: 10),
            unselectedLabelColor: AppColor.textColor,
            labelColor: AppColor.textColor,
            labelStyle: GoogleFonts.jost(
                fontWeight: FontWeight.w500,
                fontSize: 15
            ),
            unselectedLabelStyle: GoogleFonts.jost(
                fontWeight: FontWeight.w500,
                fontSize: 15
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: const [
              Tab(text: 'About',),
              Tab(text: 'Curriculum',),
            ]),
         Container(
          height: MediaQuery.of(context).size.height*.3,
          padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 16),
          child:  TabBarView(
            children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ReadMoreText(
                widget.desc, textScaleFactor: 1,
                trimLines: 10,
                style: GoogleFonts.mulish(
                  color: AppColor.readTextColor,
                  fontStyle: FontStyle.normal,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  height: 1.5
                ),
                colorClickableText: Colors.black,
                moreStyle: GoogleFonts.mulish(
                  color: AppColor.activeColor,
                  fontStyle: FontStyle.normal,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
                lessStyle: GoogleFonts.mulish(
                  color: AppColor.secondaryTextColor,
                  fontStyle: FontStyle.normal,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Read More',
                trimExpandedText: ' show less',
              ),
            ),
              widget.course!.isNotEmpty?Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: RichText(
                          textScaleFactor: 1,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                        text: 'Section 01 - ',
                        style: GoogleFonts.jost(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColor.textColor
                        ),
                        children: [
                   widget.type == 'category'   ?
                   TextSpan(
                       text: widget.courseDetail![0].crs_name.toString(),
                       style: GoogleFonts.jost(
                           fontSize: 15,
                           fontWeight: FontWeight.w500,
                           color: AppColor.primaryColor
                       ),
                   ):
                   TextSpan(
                            text: widget.course!.isNotEmpty?widget.course![0].main_module!.module_title.toString():'',
                            style: GoogleFonts.jost(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: AppColor.primaryColor
                            ),
                          )
                        ]
                      )),
                    ),
                    InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: (){
                          pushNewScreen(context, screen: VideoPlayerScreen(url: widget.course![0].main_module!.sub_module!= null?widget.course![0].main_module!.sub_module![0].course_videos![0].course_video.toString():widget.course![0].main_module!.course_videos![0].course_video.toString(),
                          title: widget.type == 'category' ? widget.courseDetail![0].crs_name.toString(): widget.course!.isNotEmpty?widget.course![0].main_module!.module_title.toString():'',
                          ),pageTransitionAnimation: PageTransitionAnimation.fade,withNavBar: false);
                        },
                        child: SizedBox(
                            height: 20,width: 20,
                            child: SvgPicture.asset('assets/images/watch.svg')))
                  ],

                ),

                Expanded(
                  child:  ListView.separated(
                    itemCount:  widget.type == 'category'   ?1: widget.course![0].main_module!.sub_module!=null?widget.course![0].main_module!.sub_module!.length:0,
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
                                      Text('${widget.course![0].main_module!.sub_module![index1].module_title} ',
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

                /*  ListView.separated(
                    itemCount:   widget.type == 'category' ? 1: widget.course!.isNotEmpty?widget.course![0].main_module!.course_videos!.length:0,
                    shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index){
                      return CurriculumList(number:  widget.type == 'category'   ?1:1,
                      chapter: '${widget.course![0].main_module!.sub_module!=null?widget.course![0].main_module!.sub_module![index].module_title:''}',time: item[index].time,icon: 'assets/images/watch.svg',);
                  }, separatorBuilder: (BuildContext context, int index) {
                      return Divider(color: AppColor.secondaryColor,
                      height: 48,);
                  },),*/
                ),
                InkWell(
                  onTap: (){
                    pushNewScreen(context, screen:  Curriculum(courseDetail:widget.courseDetail,type: widget.type,course: widget.course, amount: widget.amount.toString(),),pageTransitionAnimation: PageTransitionAnimation.fade,withNavBar: false);
                  },
                  child: Center(
                    child: Text('View All',
                    style: GoogleFonts.mulish(
                      color: AppColor.activeColor,
                      decoration: TextDecoration.underline,
                    ),),
                  ),
                )
              ],
            ):Center(
                child: Text('Coming Soon',
                style: GoogleFonts.mulish(
                  color: Colors.black
                ),),
              ),
          ],),
        )
      ],
    );
  }
}


class Curriculcum{
  final number;
  final chapter;
  final time;

  Curriculcum(this.number, this.chapter, this.time);
}
