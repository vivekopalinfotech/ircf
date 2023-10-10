import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/otp_screen.dart';
import 'package:ircf/widgets/title_bar.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: AppColor.whiteBG,
      body: Padding(
        padding: const EdgeInsets.only(top: 45,bottom: 32,left: AppConstants.HORIZONTAL_PADDING,right: AppConstants.HORIZONTAL_PADDING),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
           Column(
             children: [
               const TitleBar(title: 'Enter Your Mobile',),
               Padding(padding: const EdgeInsets.only(top: 42),
                 child: Image.asset('assets/images/logo.png',height: 100,width: 100,),),
             ],
           ),
            IntlPhoneField(
              style: GoogleFonts.jost(
                color: Colors.black
              ),
              dropdownTextStyle: GoogleFonts.jost(
                color: Colors.black
              ),
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
              ),
              flagsButtonMargin: EdgeInsets.zero,
              flagsButtonPadding: const EdgeInsets.all(8),
              dropdownIconPosition: IconPosition.trailing,
              dropdownIcon: const Icon(Icons.keyboard_arrow_down_rounded,
                color: Color.fromRGBO(29, 29, 27, 1),),
              decoration:  InputDecoration(
                labelText: 'Phone Number',
                labelStyle: GoogleFonts.jost(
                  color: Colors.black.withOpacity(.50)
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(18)
                ),
              ),
              initialCountryCode: 'US',
              pickerDialogStyle: PickerDialogStyle(backgroundColor: AppColor.secondaryColor,
              countryCodeStyle: GoogleFonts.jost(color: Colors.black),
              countryNameStyle: GoogleFonts.jost(color: Colors.black),
              searchFieldPadding: EdgeInsets.zero,
              searchFieldInputDecoration: InputDecoration(
                hintStyle: GoogleFonts.jost(
                  color: Colors.black,
                ),
                floatingLabelStyle: GoogleFonts.jost(
                  color: Colors.black
                ),
                prefixIconColor: Colors.black,
                labelStyle: GoogleFonts.jost(
                  color: Colors.black
                ),
              )),

              onChanged: (phone) {
                print(phone.completeNumber);
              },
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const OtpScreen()));
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
