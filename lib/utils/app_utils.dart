import 'package:intl/intl.dart';

class AppUtils{
  static String newDate(String isoDate) {
    var date = DateTime.parse(isoDate);
    var formatter = DateFormat('MMM d yyyy');
    return formatter.format(date);
  }
  static String convertDate(String isoDate) {
    var date = DateTime.parse(isoDate);
    var formatter = DateFormat('MM-dd-yyyy');
    return formatter.format(date);
  }

}