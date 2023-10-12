import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/screens/home/detail_tabs.dart';
import 'package:ircf/screens/home/widget/curriculum_list.dart';
import 'package:ircf/screens/payment/payment.dart';
import 'package:ircf/widgets/title_bar.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Curriculum extends StatefulWidget {
  const Curriculum({super.key});

  @override
  State<Curriculum> createState() => _CurriculumState();
}

class _CurriculumState extends State<Curriculum> {
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
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const TitleBar(
                    title: 'Curriculum',
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
                                      icon: 'assets/images/lock.svg',
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
                                      icon: 'assets/images/lock.svg',
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
                        const SizedBox(height: 100,),
                      ],
                    ),
                  ))
                ])),
            Positioned(
              bottom: 20,left: 0,right: 0,
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
                        )

                    ),
                    onPressed: (){
                      
                      pushNewScreen(context, screen: PaymentMethod(),pageTransitionAnimation: PageTransitionAnimation.fade,withNavBar: false);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 48,),
                        Center(
                          child: Text('Enroll Course - \$${55}',
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
              ),
            )
              ],
        ),

    );
  }
}
