import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';

class CenterScreen extends StatefulWidget {
  const CenterScreen({super.key});

  @override
  State<CenterScreen> createState() => _CenterScreenState();
}

class _CenterScreenState extends State<CenterScreen> {
  TextEditingController searchController = TextEditingController();
  
  List<Item> item = [
    Item('assets/images/black_image.png', 'Center - 1', 'Maninagar, Ahmedabad'),
    Item('assets/images/black_image.png', 'Center - 2', 'Gota, Ahmedabad'),
    Item('assets/images/black_image.png', 'Center - 3', 'Naroda, Ahmedabad'),
    Item('assets/images/black_image.png', 'Center - 4', 'Vasna, Ahmedabad'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteBG,
        body: Padding(
            padding: const EdgeInsets.only(
              top: 45,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
                Text(
                  'Center',
                  textScaleFactor: 1,
                  style: GoogleFonts.jost(color: AppColor.textColor, fontWeight: FontWeight.w500, fontSize: 21),
                ),
                const SizedBox(
                  height: 16,
                ),

                Card(
                  elevation: 2,
                  shape: const RoundedRectangleBorder(
                      borderRadius:  BorderRadius.all(Radius.circular(12))
                  ),
                  margin: EdgeInsets.zero,
                  color: Colors.white,
                  child: Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 10),

                    child: MediaQuery(
                      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: searchController,
                        autofocus: false,
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontSize: AppConstants.SMALL,
                          fontWeight: FontWeight.w400,
                        ),
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Search Center',
                          hintStyle: GoogleFonts.montserrat(
                            color: AppColor.hintColor,
                            fontStyle: FontStyle.normal,
                            fontSize: AppConstants.SMALL,
                            fontWeight: FontWeight.w400,
                          ),
                          prefixIconConstraints: BoxConstraints(
                            maxHeight: 20,minWidth: 40),
                          suffixIconConstraints: BoxConstraints(
                              maxWidth: 38,maxHeight: 38
                          ),

                          prefixIcon: SvgPicture.asset('assets/images/search.svg',height: 20,width: 20,),
                          suffixIcon: InkWell(
                            splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: (){},
                              child: SvgPicture.asset('assets/images/FILTER.svg',height: 38,width: 38,)),
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: 1.0), borderRadius: BorderRadius.all(Radius.circular(12))),
                          enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent), borderRadius: BorderRadius.all(Radius.circular(30))),

                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        textScaleFactor: 1,
                        text: TextSpan(
                      text: 'Result for ',
                    style: GoogleFonts.jost(
                        fontWeight: FontWeight.w500,
                        color: AppColor.textColor,
                        fontSize: 15
                    ),
                      children: [
                        TextSpan(
                          text: '“',
                          style: GoogleFonts.jost(
                            fontWeight: FontWeight.w500,
                            color: AppColor.textColor,
                            fontSize: 15
                          )
                        ),
                        TextSpan(
                            text: 'Ahmedabad',
                            style: GoogleFonts.jost(
                                fontWeight: FontWeight.w500,
                                color: AppColor.primaryColor,
                                fontSize: 15
                            )
                        ),
                        TextSpan(
                            text: '”',
                            style: GoogleFonts.jost(
                                fontWeight: FontWeight.w500,
                                color: AppColor.textColor,
                                fontSize: 15
                            )
                        ),
                      ]
                    )),
                    Row(
                      children: [
                        Text('4 FOUNDS  ',
                            textScaleFactor: 1,
                            style: GoogleFonts.mulish(
                                fontWeight: FontWeight.bold,
                                color: AppColor.primaryColor,
                                fontSize: 12
                            )),
                        SvgPicture.asset('assets/images/right_arrow.svg',height:10,width: 5,color: AppColor.primaryColor,)
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: item.length,

                    itemBuilder: (context,index){
                      return InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: (){

                        },
                        child: Row(
                          children: [
                            Container(
                              height: 66,width: 66,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(item[index].img)
                                  )
                              ),
                            ),
                            const SizedBox(width: 11,),
                            Flexible(child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(item[index].Center,
                                  textScaleFactor: 1,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.jost(
                                      color: AppColor.textColor,fontSize: 17,
                                      fontWeight: FontWeight.w500
                                  ),),

                                Text(item[index].location,
                                  textScaleFactor: 1,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.mulish(
                                      color: AppColor.secondaryTextColor,fontSize: 13,
                                      fontWeight: FontWeight.bold
                                  ),),
                                const SizedBox(height: 10,),
                                Text(
                                  'Register Now!',
                                  textScaleFactor: 1,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mulish(
                                      color: AppColor.tealColor,fontSize: AppConstants.XSMALL,
                                      fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline
                                  ),
                                )
                              ],
                            ))
                          ],
                        ),
                      );
                    }, separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 48,
                      color: AppColor.cardColor,
                    );
                  },
                  ),
                )
              ]),
            )));
  }
}

class Item{
  final img;
  final Center;
  final location;

  Item(this.img, this.Center, this.location);
}