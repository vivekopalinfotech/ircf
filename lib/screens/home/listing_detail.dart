import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/cubit/course_module/course_module_cubit.dart';
import 'package:ircf/cubit/course_module/course_module_state.dart';
import 'package:ircf/model/all_listing_response.dart';
import 'package:ircf/model/course_listing_response.dart';
import 'package:ircf/model/course_module_response.dart';
import 'package:ircf/screens/home/curriculum.dart';
import 'package:ircf/screens/home/detail_tabs.dart';
import 'package:ircf/screens/home/widget/detail_widget.dart';
import 'package:ircf/screens/payment/payment.dart';
import 'package:ircf/utils/loader.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class ListingDetail extends StatefulWidget {
  final title;
  final subtitle;
  final String id;

  final List<CourseDetail>? courseDetail;
  final List<Course>? course;
  final type;
  const ListingDetail({super.key, this.title, this.type, this.courseDetail, this.course, this.subtitle, required this.id});

  @override
  State<ListingDetail> createState() => _ListingDetailState();
}

class _ListingDetailState extends State<ListingDetail> {
  TabController? tabController;

  @override
  void initState() {
    BlocProvider.of<CourseModuleCubit>(context).courseModule(widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CourseModuleCubit, CourseModuleState>(listener: (context, state) async {
      if (state is CourseModuleSuccess) {}

    }, builder: (context, state) {
      if (state is CourseModuleSuccess) {
        return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColor.whiteBG,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*.4,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [

                        Center(
                          child: CachedNetworkImage(
                            imageUrl: '${AppConstants.IMAGE_URL}${state.courseModuleResponse.course!.crs_image}',
                            fit: BoxFit.contain,
                            progressIndicatorBuilder: (context, url, progress) => const CupertinoActivityIndicator(),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: AppConstants.HORIZONTAL_PADDING,top: 74),
                            child: InkWell(
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
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.55,),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text('Instructor',
                  //         textScaleFactor: 1,
                  //         style: GoogleFonts.jost(
                  //             fontWeight: FontWeight.w500,
                  //             fontSize: AppConstants.LARGE,
                  //             color: AppColor.textColor
                  //         ),),
                  //       const SizedBox(height: 13,),
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //         Flexible(
                  //           flex: 7,
                  //           child: Row(
                  //             children: [
                  //               Container(
                  //                 height: 54,width: 54,
                  //                 decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(50),
                  //                     image: const DecorationImage(
                  //                         image: NetworkImage('https://i.pinimg.com/originals/1e/ea/13/1eea135a4738f2a0c06813788620e055.jpg',)
                  //                     )
                  //                 ),
                  //               ),
                  //               const SizedBox(width: 12,),
                  //               Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Text('William S. Cunningham',
                  //                     textScaleFactor: 1,
                  //                     maxLines: 1,
                  //                     overflow: TextOverflow.ellipsis,
                  //                     style: GoogleFonts.jost(
                  //                         fontWeight: FontWeight.w500,
                  //                         fontSize: 17,
                  //                         color: AppColor.textColor
                  //                     ),),
                  //                   Text('Graphic Design',
                  //                     textScaleFactor: 1,
                  //                     maxLines: 1,
                  //                     overflow: TextOverflow.ellipsis,
                  //                     style: GoogleFonts.mulish(
                  //                         fontWeight: FontWeight.bold,
                  //                         fontSize: 13,
                  //                         color: AppColor.secondaryTextColor
                  //                     ),),
                  //                 ],
                  //               )
                  //             ],
                  //           ),
                  //         ),
                  //           Flexible(
                  //             flex: 1,
                  //             child: SvgPicture.asset('assets/images/comment.svg'),
                  //           )
                  //         ],
                  //       ),
                  //       Divider(height: 42,color: AppColor.secondaryColor,),
                  //       Text('What You’ll Get',
                  //         textScaleFactor: 1,
                  //         style: GoogleFonts.jost(
                  //             fontWeight: FontWeight.w500,
                  //             fontSize: AppConstants.LARGE,
                  //             color: AppColor.textColor
                  //         ),),
                  //       const WidgetList(),
                  //
                  //     ],
                  //   ),
                  // ),
                   const SizedBox(height: 140,)
                ],
              ),
              Positioned(
                top: MediaQuery.of(context).size.height*.38,left: 0,right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING),
                  child: SingleChildScrollView(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width*.9,
                      child:  Card(
                        margin: EdgeInsets.zero,
                        shape:  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                        ),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 55,left: 20,right: 20,),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(widget.subtitle,
                                        textScaleFactor: 1,
                                        style: GoogleFonts.mulish(
                                          color: AppColor.activeColor,fontSize: AppConstants.XSMALL,
                                          fontWeight: FontWeight.bold
                                      ),),
                                      const SizedBox(height: 6,),
                                      Text(widget.title,
                                        textScaleFactor: 1,
                                        style: GoogleFonts.jost(
                                            color: AppColor.textColor,fontSize: AppConstants.XLARGE,
                                            fontWeight: FontWeight.w500
                                        ),),
                                      const SizedBox(height: 15,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset('assets/images/video_cam.svg'),
                                              Text('  ${state.courseModuleResponse.course_module!.length} classes',
                                                textScaleFactor: 1,
                                                style: GoogleFonts.mulish(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColor.textColor
                                                ),),
                                              Container(
                                                margin: const EdgeInsets.symmetric(horizontal: 16),
                                                height: 14,width: 2,
                                                color: Colors.black,
                                              ),
                                              SvgPicture.asset('assets/images/time.svg'),
                                              Text(' ${state.courseModuleResponse.course!.course_time}',
                                                textScaleFactor: 1,
                                                style: GoogleFonts.mulish(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColor.textColor
                                                ),),
                                            ],
                                          ),
                                          Text('₹ ${state.courseModuleResponse.course!.crs_amount}',
                                            textScaleFactor: 1,
                                            style: GoogleFonts.mulish(
                                                fontSize: 21,
                                                fontWeight: FontWeight.bold,
                                                color: AppColor.primaryColor
                                            ),)
                                        ],
                                      ),

                                    ],
                                  ),
                                ),
                                DetailTabs(controller: tabController,courseDetail:widget.courseDetail,type: widget.type,course: state.courseModuleResponse.course_module,desc:state.courseModuleResponse.course!.crs_desc,amount: state.courseModuleResponse.course!.crs_amount,)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height*.35,right: MediaQuery.of(context).size.width*.12,
                child: SizedBox(
                  height: 63,width: 63,
                  child:
                  ElevatedButton(
                    style: ButtonStyle(
                        padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 8)),
                        backgroundColor: MaterialStatePropertyAll<Color>(AppColor.primaryColor),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                    ),
                  onPressed: () {  },
                  child: Center(
                    child: SvgPicture.asset('assets/images/play.svg',color: Colors.white,),
                  ),
                  ),
                ),),
            ],
          ),
        ),
        floatingActionButton: state.courseModuleResponse.course!.crs_amount.toString() == '0' ?const SizedBox(): Container(
          margin: const EdgeInsets.only(left: 48,right: 16,bottom: 20),
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
                  )

              ),
              onPressed: (){
               //   pushNewScreen(context, screen:  Curriculum(courseDetail:widget.courseDetail,type: widget.type,course: state.courseModuleResponse.course_module, amount: state.courseModuleResponse.course!.crs_amount.toString(),),pageTransitionAnimation: PageTransitionAnimation.fade,withNavBar: false);
                pushNewScreen(context, screen:  PaymentMethod(id:widget.id,name: state.courseModuleResponse.course!.crs_name,short_name: state.courseModuleResponse.course!.crs_short_name,img: '${AppConstants.IMAGE_URL}${state.courseModuleResponse.course!.crs_image}',amount: state.courseModuleResponse.course!.crs_amount,), pageTransitionAnimation: PageTransitionAnimation.fade, withNavBar: false);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 48,),
                  Center(
                    child: Text('Enroll Course  ₹ ${state.courseModuleResponse.course!.crs_amount}',
                      textScaleFactor: 1,
                      style: GoogleFonts.jost(
                          color: Colors.white,
                          fontSize: AppConstants.LARGE,
                          fontWeight: FontWeight.w500
                      ),),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 48,width: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: Colors.white
                      ),
                      child: Center(child: Icon(CupertinoIcons.arrow_right,size: 30,color: AppColor.primaryColor,)),
                    ),
                  ),
                ],
              )),
        )));
      }
      if (state is CourseModuleLoading) {
        loader(context);
      }
      return AppConstants.LOADER;
    });
  }
}
