
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';

class AppBadge{
  static final AppBadge _singleton = AppBadge._internal();

  factory AppBadge() {
    return _singleton;
  }

  AppBadge._internal();
  int totalModules = 0;

  ValueNotifier<int> moduleTotalitemsListener = ValueNotifier<int>(0);
  void BadgeUpdate(int value){
    if(value == null) value=0;
    moduleTotalitemsListener.value += value;
    totalModules = value;
  }
  assignListner(ValueNotifier<int> updateBg){
    moduleTotalitemsListener= updateBg;
  }
  int getBadgeUpdate(){
    moduleTotalitemsListener.value;
    return totalModules;
  }
}