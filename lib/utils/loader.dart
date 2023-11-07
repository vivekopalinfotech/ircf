import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ircf/color/app_color.dart';

loader(BuildContext context) {
  Loader.show(context,
      isSafeAreaOverlay: false,
      isAppbarOverlay: true,
      isBottomBarOverlay: true,
      progressIndicator:  Center(
          child: Platform.isIOS ?
          CupertinoActivityIndicator(
            color: AppColor.primaryColor,
          ):CircularProgressIndicator(
            color: AppColor.primaryColor,
          )
      ),
      themeData: Theme.of(context).copyWith(
          colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: Colors.black38)),
      overlayColor: Colors.black38);
}