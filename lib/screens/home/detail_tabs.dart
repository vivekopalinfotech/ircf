import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/screens/home/curriculum.dart';
import 'package:ircf/screens/home/widget/curriculum_list.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:readmore/readmore.dart';

class DetailTabs extends StatefulWidget {
  final controller;
  const DetailTabs({super.key, this.controller});

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
                'The cardiopulmonary resuscitation (CPR) guidelines of compression-only life support (COLS) for management of the victim with cardiopulmonary arrest in adults provide a stepwise algorithmic approach for optimal outcome of the victim outside the hospital by untrained laypersons, this is testing text The cardiopulmonary resuscitation (CPR) guidelines of compression-only life support (COLS) for management of the victim with cardiopulmonary arrest in adults provide a stepwise algorithmic approach for optimal outcome of the victim outside the hospital by untrained laypersons, this is testing text....', textScaleFactor: 1,
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
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        textScaleFactor: 1,
                        text: TextSpan(
                      text: 'Section 01 - ',
                      style: GoogleFonts.jost(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColor.textColor
                      ),
                      children: [
                        TextSpan(
                          text: 'Introduction',
                          style: GoogleFonts.jost(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: AppColor.primaryColor
                          ),
                        )
                      ]
                    )),
                    Text('25 Mins',
                      style: GoogleFonts.mulish(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColor
                      ),)
                  ],

                ),

                Expanded(
                  child: ListView.separated(
                    itemCount: item.length,
                    shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index){
                      return CurriculumList(number: item[index].number,
                      chapter: item[index].chapter,time: item[index].time,icon: 'assets/images/watch.svg',);
                  }, separatorBuilder: (BuildContext context, int index) {
                      return Divider(color: AppColor.secondaryColor,
                      height: 48,);
                  },),
                )
              ],
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