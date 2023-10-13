import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/widgets/show_snackbar.dart';

class EReceipt extends StatefulWidget {
  const EReceipt({super.key});

  @override
  State<EReceipt> createState() => _EReceiptState();
}

class _EReceiptState extends State<EReceipt> {
  
  List<Info> item = [
    Info('Name', 'Scott R. Shoemake'),
    Info('Email ID', 'shoemake.redial@gmail.com'),
    Info('Course', '3d Character Illustration Cre..'),
    Info('Category', 'Web Development'),
    Info('TransactionID', 'SK345680976'),
    Info('Price', '\$${55.00}'),
    Info('Date', 'Nov 20, 202X   /   15:45'),
    Info('Status', 'Paid'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteBG,
        body: Padding(
            padding: const EdgeInsets.only(
              top: 45,
            ),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 7,
                        child: Row(
                          children: [
                            InkWell(
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
                            Text(
                              ' E-Receipt',
                              textScaleFactor: 1,
                              style: GoogleFonts.jost(color: AppColor.textColor, fontWeight: FontWeight.w500, fontSize: 21),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: SvgPicture.asset(
                          'assets/images/menu.svg',
                          height: 24,
                          width: 24,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                Center(
                  child: SvgPicture.asset(
                    'assets/images/building.svg',
                    height: 100,
                    width: 101.51,
                  ),
                ),
                const SizedBox(
                  height: 29,
                ),
                Center(
                  child: SvgPicture.asset(
                    'assets/images/BARCODE.svg',

                  ),
                ),
                const SizedBox(height: 35,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: item.length,

                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(item[index].key,
                              textScaleFactor: 1,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.jost(
                                  color: AppColor.textColor,fontSize: 15,
                                  fontWeight: FontWeight.w500
                              ),),

                           item[index].key == 'Status'?
                           Container(
                             color: AppColor.tealColor,
                             height: 22,
                             padding: const EdgeInsets.symmetric(horizontal: 17,vertical: 4),
                             child: Text(
                               item[index].value,
                               textScaleFactor: 1,
                               textAlign: TextAlign.center,
                               style: GoogleFonts.mulish(
                                   color: Colors.white,fontSize: AppConstants.XSMALL,
                                   fontWeight: FontWeight.bold
                               ),
                             ),
                           ):item[index].key == 'TransactionID'?
                               Row(
                                 children: [
                                   Text('${item[index].value}  ',
                                     textScaleFactor: 1,
                                     maxLines: 1,
                                     overflow: TextOverflow.ellipsis,
                                     style: GoogleFonts.mulish(
                                         color: AppColor.secondaryTextColor,fontSize: 13,
                                         fontWeight: FontWeight.bold
                                     ),),
                                   InkWell(
                                     onTap: (){
                                       showSuccessSnackBar(context, 'Transaction ID copied to clipboard');
                                       Clipboard.setData(const ClipboardData(text: 'SK345680976' ));
                                     },
                                     child: SvgPicture.asset('assets/images/copy.svg',
                                     height: 16,width: 13.71,),
                                   ),
                                 ],
                               ):
                           Text(item[index].value,
                              textScaleFactor: 1,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.mulish(
                                  color: AppColor.secondaryTextColor,fontSize: 13,
                                  fontWeight: FontWeight.bold
                              ),),

                          ],
                        ),
                      );
                    },
                ))
              ])
            ])));
  }
}

class Info {
  final key;
  final value;

  Info(this.key, this.value);
}