


import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ircf/color/app_color.dart';


class AppConstants {

  static const XSMALL = 12.0;
  static const SMALL = 14.0;
  static const MEDIUM = 16.0;
  static const LARGE = 18.0;
  static const XLARGE = 20.0;
  static const XXLARGE = 24.0;
  static const HORIZONTAL_PADDING = 34.0;
  static Widget LOADER = Center(
    child: Platform.isIOS ?
        CupertinoActivityIndicator(
          color: AppColor.primaryColor,
        ):CircularProgressIndicator(
      color: AppColor.primaryColor,
    )
  );
}
