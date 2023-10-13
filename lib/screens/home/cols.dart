import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
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
class Cols extends StatefulWidget {
  const Cols({super.key});

  @override
  State<Cols> createState() => _ColsState();
}

class _ColsState extends State<Cols> {
  bool isSaved = false;

  toggelButton() async {
    setState(() {
      isSaved = !isSaved;
    });
  }
  List<Categoryy> filterCat = [
    Categoryy('COLS','Compression-Only Life Support',true,'\$${28}','\$${42}'),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteBG,
        body: ListView.builder(
            itemCount: filterCat.length,
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
                                Text(filterCat[index].name,
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
                              filterCat[index].title,
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
                                    text: '${filterCat[index].disPrice} ',
                                    style: GoogleFonts.mulish(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.primaryColor
                                    ),
                                    children: [
                                      TextSpan(
                                        text: filterCat[index].price,
                                        style: GoogleFonts.mulish(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.offColor,
                                          decoration: TextDecoration.lineThrough,
                                        ),
                                      )
                                    ]
                                )),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: (){
                                    pushNewScreen(context, screen: const ListingDetail(),withNavBar: false,pageTransitionAnimation: PageTransitionAnimation.fade);
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
            })
    );
  }
}
