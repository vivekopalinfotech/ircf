import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/screens/login/otp_screen.dart';
import 'package:ircf/widgets/show_snackbar.dart';
import 'package:ircf/widgets/title_bar.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  int phoneNumber = 0;
  String mobile = '';
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
              initialCountryCode: 'IN',
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

                print(phone.number.length);
                phoneNumber = phone.number.length;
                mobile = phone.number.toString();
              },
            ),
            SizedBox(
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
                    phoneNumber < 10 ?showSnackBar(context,'Please Enter Valid Phone Number'):
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  OtpScreen(mobile: mobile)));
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
