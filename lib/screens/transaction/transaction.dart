import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/screens/transaction/e-receipt.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  
  List<Item> item = [
    Item('Build Personal Branding', 'Web Designer','assets/images/black_image.png'),
    Item('Mastering Blender 3D', 'Ui/UX Designer','assets/images/black_image.png'),
    Item('Full Stack Web Development', 'Web Development','assets/images/black_image.png'),
    Item('Complete UI Designer', 'HR Management','assets/images/black_image.png'),
    Item('Sharing Work with Team', 'Finance & Accounting','assets/images/IMAGE BG.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteBG,
        body: Padding(
            padding: const EdgeInsets.only(
              top: 45,
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING),
                child: Text(
                  ' Transactions',
                  textScaleFactor: 1,
                  style: GoogleFonts.jost(color: AppColor.textColor, fontWeight: FontWeight.w500, fontSize: 21),
                ),
              ),
              const SizedBox(height: 30,),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: item.length,
                  padding: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING),
                  itemBuilder: (context,index){
                    return InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: (){
                        pushNewScreen(context, screen: const EReceipt(),pageTransitionAnimation: PageTransitionAnimation.fade,withNavBar: false);
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 100,width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(item[index].img)
                              )
                            ),
                          ),
                          const SizedBox(width: 12,),
                          Flexible(child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text(item[index].title,
                                textScaleFactor: 1,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.jost(
                                    color: AppColor.textColor,fontSize: AppConstants.XLARGE,
                                    fontWeight: FontWeight.w500
                                ),),
                              const SizedBox(height: 5,),
                              Text(item[index].title,
                                textScaleFactor: 1,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.mulish(
                                    color: AppColor.secondaryTextColor,fontSize: 13,
                                    fontWeight: FontWeight.bold
                                ),),
                              const SizedBox(height: 15,),
                              Container(
                                color: AppColor.tealColor,
                                height: 22,
                                padding: const EdgeInsets.symmetric(horizontal: 17,vertical: 4),
                                child: Text(
                                  'Paid',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mulish(
                                      color: Colors.white,fontSize: AppConstants.XSMALL,
                                      fontWeight: FontWeight.bold
                                  ),
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
            ])));
  }
}

class Item{
  final title;
  final course;
  final img;

  Item(this.title, this.course, this.img);
}