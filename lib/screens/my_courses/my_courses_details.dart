// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/screens/home/detail_tabs.dart';
import 'package:ircf/screens/home/widget/curriculum_list.dart';
import 'package:http/http.dart' as http;
import 'package:ircf/screens/my_courses/final_exam.dart';
import 'package:ircf/widgets/show_snackbar.dart';
import 'package:ircf/widgets/title_bar.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';


class MyCoursesDetail extends StatefulWidget {
  final String type;
  const MyCoursesDetail({super.key, required this.type});

  @override
  State<MyCoursesDetail> createState() => _MyCoursesDetailState();
}

class _MyCoursesDetailState extends State<MyCoursesDetail> {
  List<Curriculcum> item = [
    Curriculcum('01', 'Chapter - 1', '15 Mins'),
    Curriculcum('02', 'Chapter - 2', '10 Mins'),
  ];

  List<Curriculcum> item1 = [
    Curriculcum('03', 'Chapter - 1', '08 Mins'),
    Curriculcum('04', 'Chapter - 2', '25 Mins'),
    Curriculcum('05', 'Chapter - 2', '12 Mins'),
    Curriculcum('06', 'Chapter - 2', '10 Mins'),
  ];

  List<Curriculcum> item2 = [
    Curriculcum('07', 'Chapter - 1', '15 Mins'),
    Curriculcum('08', 'Chapter - 2', '30 Mins'),
    Curriculcum('09', 'Chapter - 2', '42 Mins'),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteBG,
      body: Stack(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 45, left: AppConstants.HORIZONTAL_PADDING, right: AppConstants.HORIZONTAL_PADDING),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                const TitleBar(
                  title: 'My Courses',
                ),
                const SizedBox(height: 18,),
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
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                          textScaleFactor: 1,
                                          text: TextSpan(text: 'Section 01 - ', style: GoogleFonts.jost(fontSize: 15, fontWeight: FontWeight.w500, color: AppColor.textColor), children: [
                                            TextSpan(
                                              text: 'Introduction',
                                              style: GoogleFonts.jost(fontSize: 15, fontWeight: FontWeight.w500, color: AppColor.primaryColor),
                                            )
                                          ])),
                                      Text(
                                        '25 Mins',
                                        style: GoogleFonts.mulish(fontSize: 12, fontWeight: FontWeight.bold, color: AppColor.primaryColor),
                                      )
                                    ],
                                  ),
                                  ListView.separated(
                                    itemCount: item.length,
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return CurriculumList(
                                        number: item[index].number,
                                        chapter: item[index].chapter,
                                        time: item[index].time,
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
                                  Divider(
                                    color: AppColor.secondaryColor,
                                    height: 48,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                          textScaleFactor: 1,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          text: TextSpan(text: 'Section 02 - ', style: GoogleFonts.jost(fontSize: 15, fontWeight: FontWeight.w500, color: AppColor.textColor), children: [
                                            TextSpan(
                                              text: 'Graphic Design',
                                              style: GoogleFonts.jost(fontSize: 15, fontWeight: FontWeight.w500, color: AppColor.primaryColor),
                                            )
                                          ])),
                                      Text(
                                        '55 Mins',
                                        style: GoogleFonts.mulish(fontSize: 12, fontWeight: FontWeight.bold, color: AppColor.primaryColor),
                                      )
                                    ],
                                  ),
                                  ListView.separated(
                                    itemCount: item1.length,
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return CurriculumList(
                                        number: item1[index].number,
                                        chapter: item1[index].chapter,
                                        time: item1[index].time,
                                        icon: widget.type == 'Completed'?'assets/images/watch.svg':'assets/images/lock.svg',
                                      );
                                    },
                                    separatorBuilder: (BuildContext context, int index) {
                                      return Divider(
                                        color: AppColor.secondaryColor,
                                        height: 48,
                                      );
                                    },
                                  ),
                                  Divider(
                                    color: AppColor.secondaryColor,
                                    height: 48,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                          textScaleFactor: 1,
                                          text: TextSpan(text: 'Section 03 - ', style: GoogleFonts.jost(fontSize: 15, fontWeight: FontWeight.w500, color: AppColor.textColor), children: [
                                            TextSpan(
                                              text: 'Let’s Practice',
                                              style: GoogleFonts.jost(fontSize: 15, fontWeight: FontWeight.w500, color: AppColor.primaryColor),
                                            )
                                          ])),
                                      Text(
                                        '35 Mins',
                                        style: GoogleFonts.mulish(fontSize: 12, fontWeight: FontWeight.bold, color: AppColor.primaryColor),
                                      )
                                    ],
                                  ),
                                  ListView.separated(
                                    itemCount: item2.length,
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return CurriculumList(
                                        number: item2[index].number,
                                        chapter: item2[index].chapter,
                                        time: item2[index].time,
                                        icon: widget.type == 'Completed'?'assets/images/watch.svg':'assets/images/lock.svg',
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
                              ),
                            ),
                          ),
                          const SizedBox(height: 130,),
                        ],
                      ),
                    ))
              ])),
          Positioned(
            bottom: 0,left: 0,right: 0,
            child: Container(
              height: 106,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING),
              child:

              widget.type == 'Completed' ?
              Row(
                children: [
                  InkWell(
                    onTap: (){
                      downloadAndSaveImage('https://static.vecteezy.com/system/resources/previews/000/636/497/original/vector-portrait-luxury-certificate-template-with-elegant-border-frame-diploma-design-for-graduation-or-completion.jpg');
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: AppColor.cardColor,
                        border: Border.all(
                          color: AppColor.offColor
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: Center(
                        child: SvgPicture.asset('assets/images/ceritificate.svg'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
               SizedBox(
                    height: 60,
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
                          pushNewScreen(context, screen: const FinalExam(),pageTransitionAnimation: PageTransitionAnimation.fade,withNavBar: false);},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(width: 10,),
                            Center(
                              child: Text('Start Course Again',
                                textScaleFactor: 1,
                                style: GoogleFonts.jost(
                                    color: Colors.white,
                                    fontSize: AppConstants.LARGE,
                                    fontWeight: FontWeight.w500
                                ),),
                            ),
                            const SizedBox(width: 8,),
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
                  )
                ],
              ):Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
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

                        },

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(width: 48,),
                            Center(
                              child: Text('Continue Courses',style: GoogleFonts.jost(
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
                  ),
                ],
              ),
            ),
          )
        ],
      ),

    );
  }
  Future<void> downloadAndSaveImage(image) async {
    String imageUrl = image;
    var response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      await ImageGallerySaver.saveImage(Uint8List.fromList(response.bodyBytes));
      showSuccessSnackBar(context,'Certificate Successfully downloaded');
    } else {
      print('Failed to download image');
    }
  }
}
