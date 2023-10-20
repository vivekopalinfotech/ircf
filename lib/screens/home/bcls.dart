import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/cubit/course_listing/course_listing_cubit.dart';
import 'package:ircf/cubit/course_listing/course_listing_state.dart';
import 'package:ircf/screens/home/listing_detail.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Categoryy{
  final name;
  final title;
  final isSaved;
  final disPrice;
  final price;


  Categoryy(this.name, this.title, this.isSaved,this.disPrice, this.price );
}
class Bcls extends StatefulWidget {
  final name;
  final slug;
  const Bcls({super.key, this.name, this.slug});

  @override
  State<Bcls> createState() => _BclsState();
}

class _BclsState extends State<Bcls> {
  bool isSaved = false;

  toggelButton() async {
    setState(() {
      isSaved = !isSaved;
    });
  }
  List<Categoryy> filterCat = [
    Categoryy('BCLS','Basic Cardiopulmonary Life Support ',true,'\$${42}','\$${61}'),
    Categoryy('BCLS','Comprehensive Cardiopulmonary Life Support',false,'\$${51}','\$${67}'),
  ];

  @override
  void initState() {
    BlocProvider.of<CourseListingCubit>(context).courseListing(widget.slug);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteBG,
        body:
        BlocConsumer<CourseListingCubit, CourseListingState>(listener: (context, state) async {

          if (state is CourseListingSuccess) {}
          if (state is CourseListingError) {}
        }, builder: (context, state) {
          if (state is CourseListingSuccess) {
            return
              ListView.builder(
                  itemCount: state.courseListingResponse.course_detail!.length,
                  padding: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING,vertical: 17),
                  itemBuilder: (context,index){
                    return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        elevation: 2,
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(state.courseListingResponse.course_detail![index].crs_name.toString(),
                                        textScaleFactor: 1,
                                        style: GoogleFonts.mulish(
                                            fontSize: AppConstants.XSMALL,
                                            fontWeight: FontWeight.bold,
                                            color: AppColor.activeColor
                                        ),),
                                      InkWell(
                                          onTap: (){
                                            toggelButton();
                                          },
                                          child:
                                          filterCat[index].isSaved == false?
                                          SvgPicture.asset('assets/images/save.svg',height: 18,width: 15,):
                                          SvgPicture.asset('assets/images/saved.svg',height: 18,width: 15,))
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Text(
                                    state.courseListingResponse.course_detail![index].crs_short_name.toString(),
                                    textScaleFactor: 1,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: GoogleFonts.jost(
                                        fontSize: AppConstants.MEDIUM,
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.textColor),
                                  ),
                                  const SizedBox(height: 4),
                                  RichText(
                                      textScaleFactor: 1,
                                      text: TextSpan(
                                          text: '${0} ',
                                          style: GoogleFonts.mulish(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: AppColor.primaryColor
                                          ),
                                          children: [
                                            TextSpan(
                                              text: '0',
                                              style: GoogleFonts.mulish(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: AppColor.offColor,
                                                decoration: TextDecoration.lineThrough,
                                              ),
                                            )
                                          ]
                                      )),
                                  const SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: (){
                                          pushNewScreen(context,
                                              screen:  ListingDetail(title: state.courseListingResponse.course_detail![index].crs_name.toString(),),
                                              withNavBar: false,
                                              pageTransitionAnimation: PageTransitionAnimation.fade);
                                        },
                                        child: Row(
                                          children: [
                                            Text('VIEW ',
                                              textScaleFactor:1,
                                              style: GoogleFonts.mulish(
                                                  color: AppColor.primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: AppConstants.XSMALL
                                              ),),
                                            Icon(Icons.arrow_forward_ios_rounded,size: 14,color: AppColor.primaryColor,)
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ))
                          ],
                        )
                    );
                  });}
          return const Center(
              child: CircularProgressIndicator());
        })
    );
  }
}
