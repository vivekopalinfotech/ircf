import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/screens/my_courses/certificate.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';


class Completed extends StatefulWidget {
  const Completed({super.key});

  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  bool isSaved = false;

  toggelButton() async {
    setState(() {
      isSaved = !isSaved;
    });
  }
  List<Category> filterCat = [
    Category('COLS','Compression-Only Life Support',false,0.0,'5 Hrs 18 Mins'),
    Category('BCLS','Basic Cardiopulmonary Life Support ',false,0.0,'5 Hrs 18 Mins'),
    Category('CCLS','Comprehensive Cardiopulmonary Life Support',false,0.0,'5 Hrs 18 Mins'),
    Category('BCLS Instructor','Basic Cardiopulmonary Life Support',true,4.7,'5 Hrs 18 Mins'),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteBG,
        body: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING,vertical: 17),
            itemCount: filterCat.length,
            itemBuilder: (context,index){
              return Stack(
                children: [
                  Card(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      elevation: 4,

                      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Container(
                            height: 130,width: 130,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  bottomLeft: Radius.circular(16),
                                ),
                                color: Colors.black
                            ),
                          ),
                          Flexible(child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(filterCat[index].name,
                                  textScaleFactor: 1,
                                  style: GoogleFonts.mulish(
                                      fontSize: AppConstants.XSMALL,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.activeColor
                                  ),),
                                const SizedBox(height: 10,),
                                Text(
                                  filterCat[index].title,
                                  textScaleFactor: 1,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: GoogleFonts.jost(
                                      fontSize: AppConstants.MEDIUM,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.textColor),
                                ),
                                filterCat[index].instructor == true?
                                   Padding(
                                     padding: const EdgeInsets.only(top: 6,bottom: 15),
                                     child: Row(
                                       children: [
                                         SvgPicture.asset('assets/images/Star.svg'),
                                         Text(' ${filterCat[index].rating}',
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
                                         Text(' ${filterCat[index].time}',
                                           style: GoogleFonts.mulish(
                                               fontSize: 11,
                                               fontWeight: FontWeight.bold,
                                               color: AppColor.textColor
                                           ),),
                                       ],
                                     ),
                                   ) :
                                const SizedBox(height: 40,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: (){
                                        pushNewScreen(context, screen:  Certificate(title: filterCat[index].name),pageTransitionAnimation: PageTransitionAnimation.fade,withNavBar: false);
                                      },
                                      child: Text('VIEW CERTIFICATE',
                                        textScaleFactor:1,
                                        style: GoogleFonts.mulish(
                                            color: AppColor.tealColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: AppConstants.XSMALL,
                                          decoration: TextDecoration.underline
                                        ),),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ))
                        ],
                      )
                  ),
                  Positioned(
                    top: 0,right: 25,
                      child: SvgPicture.asset('assets/images/completed.svg'))
                ],
              );
            })
    );
  }
}
class Category{
  final String name;
  final String title;
  final bool instructor;
  final double rating;
  final String time;

  Category(this.name, this.title, this.instructor, this.rating, this.time);
}