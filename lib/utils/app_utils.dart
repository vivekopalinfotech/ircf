import 'package:intl/intl.dart';

class AppUtils{
  static String newDate(String isoDate) {
    var date = DateTime.parse(isoDate);
    var formatter = DateFormat('MMM d yyyy');
    return formatter.format(date);
  }
  static String convertDate(String isoDate) {
    var date = DateTime.parse(isoDate);
    var formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }

  static String oldDate(String inputDate) {
    DateTime parsedDate = DateFormat('yyyy-MM-dd').parse(inputDate);
    String formattedDate = DateFormat('MMM d yyyy').format(parsedDate);
    return formattedDate;
  }
}