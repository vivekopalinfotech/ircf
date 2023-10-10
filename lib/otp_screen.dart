import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/fill_profile.dart';
import 'package:ircf/widgets/otp_input.dart';
import 'package:ircf/widgets/title_bar.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteBG,
      body:  Padding(
        padding: const EdgeInsets.only(top: 45,bottom: 32,left: AppConstants.HORIZONTAL_PADDING,right: AppConstants.HORIZONTAL_PADDING),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            Column(
              children: [
                const TitleBar(title: 'Enter OTP',),
                Padding(padding: const EdgeInsets.only(top: 114,bottom: 80),
                  child: Container(
                    height: 40,
                    child: Text('Enter a OTP Number to Login',style: GoogleFonts.mulish(
                      color: AppColor.secondaryTextColor,
                      fontSize: AppConstants.SMALL,fontWeight: FontWeight.bold
                    ),),
                  ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OtpInput(_fieldOne, true),
                    OtpInput(_fieldTwo, false),
                    OtpInput(_fieldThree, false),
                    OtpInput(_fieldFour, false)
                  ],
                ),
              ],
            ),

            Container(
              height: 60,width: MediaQuery.of(context).size.width,

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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FillProfile()));
                  },

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 48,),
                      Center(
                        child: Text('Continue',style: GoogleFonts.jost(
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
            )
          ],
        ),
      ),
    );
  }
}
