import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 60,
      margin: EdgeInsets.symmetric(horizontal: 10),

      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: TextFormField(
          obscureText: true,
          obscuringCharacter: '*',
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          controller: controller,
          style: GoogleFonts.jost(
            color: Colors.black,
            fontStyle: FontStyle.normal,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          maxLength: 1,
          cursorColor: AppColor.primaryColor,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            filled: true,
            fillColor: Colors.white,
            errorStyle:  GoogleFonts.montserrat(height: 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide:BorderSide(
                  color: AppColor.borderColor
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide:  BorderSide(
                color: AppColor.borderColor
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                  color: AppColor.borderColor
              ),
            ),

            counterText: '',
            hintStyle: GoogleFonts.montserrat(
              color: Theme.of(context).brightness == Brightness.dark ?  Colors.white.withOpacity(.75): const Color(0xff656565),
              fontStyle: FontStyle.normal,
              fontSize: AppConstants.SMALL,
              fontWeight: FontWeight.w300,
            ),
          ),
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty) {
              FocusScope.of(context).previousFocus();
            }
          },
          validator: (otpvalidation) {
            if (otpvalidation!.isEmpty) {
              return "";
            }
            return null;
          },
        ),
      ),
    );
  }
}