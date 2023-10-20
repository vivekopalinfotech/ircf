import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/screens/login/fill_profile.dart';
import 'package:ircf/widgets/otp_input.dart';
import 'package:ircf/widgets/title_bar.dart';

class OtpScreen extends StatefulWidget {
  final mobile;
  const OtpScreen({super.key, this.mobile});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String? otp;

  @override
  void initState() {
    phoneController.text =  widget.mobile;
    super.initState();
  }
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

                IntlPhoneField(
                  style: GoogleFonts.jost(color: Colors.black),
                  dropdownTextStyle: GoogleFonts.jost(color: Colors.black),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  disableLengthCheck: true,
                  flagsButtonMargin: EdgeInsets.zero,
                  flagsButtonPadding: const EdgeInsets.all(8),
                  dropdownIconPosition: IconPosition.trailing,
                  dropdownIcon: const Icon(Icons.keyboard_arrow_down_rounded, color: Color.fromRGBO(29, 29, 27, 1)),
                  decoration: InputDecoration(
                    labelText: phoneController.text.isNotEmpty?'':'Phone Number',
                    labelStyle: GoogleFonts.jost(color: Colors.black.withOpacity(.50)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(12)),
                  ),
                  initialCountryCode: 'IN',
                  pickerDialogStyle: PickerDialogStyle(
                      backgroundColor: AppColor.secondaryColor,
                      countryCodeStyle: GoogleFonts.jost(color: Colors.black),
                      countryNameStyle: GoogleFonts.jost(color: Colors.black),
                      searchFieldPadding: EdgeInsets.zero,
                      searchFieldInputDecoration: InputDecoration(
                        hintStyle: GoogleFonts.jost(
                          color: Colors.black,
                        ),
                        floatingLabelStyle: GoogleFonts.jost(color: Colors.black),
                        prefixIconColor: Colors.black,
                        labelStyle: GoogleFonts.jost(color: Colors.black),
                      )),
                  controller: phoneController,
                  onChanged: (phone) {
                    print(phone.completeNumber);

                  },
                ),
                SizedBox(height: 20,),
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
                    setState(() {
                      otp = _fieldOne.text +
                          _fieldTwo.text +
                          _fieldThree.text +
                          _fieldFour.text;
                    });
                  otp!.length < 4 ? ""
                      : Navigator.push(context, MaterialPageRoute(builder: (context) =>  FillProfile(mobile: widget.mobile)));
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
