import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';

showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: AppColor.error,
          duration: const Duration(milliseconds: 3000),
          content: Center(
              child: Text(message, textScaleFactor: 1,
                textAlign: TextAlign.center,
                style:  GoogleFonts.montserrat(
                    color: Colors.white),))));
}

showSuccessSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: AppColor.primaryColor,
          duration: const Duration(milliseconds: 1500),
          content: Center(
              child: Text(message,
                textAlign: TextAlign.center,
                style:  GoogleFonts.jost(
                    color: Colors.white),))));
}