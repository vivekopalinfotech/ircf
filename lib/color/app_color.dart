import 'package:flutter/rendering.dart';


class AppColor {

  static Color primaryColor = const Color.fromRGBO(74, 166, 221, 1);
  static Color secondaryColor = const Color.fromRGBO(213, 226, 245, 1);
  static Color whiteBG = const Color.fromRGBO(245, 249, 255, 1);
  static Color textColor = const Color.fromRGBO(32, 34, 68, 1);
  static Color secondaryTextColor = const Color.fromRGBO(84, 84, 84, 1);
  static Color textFieldColor = const Color.fromRGBO(243, 243, 243, 1);
  static Color borderColor = const Color.fromRGBO(180, 189, 196, 0.4);
  static Color offColor = const Color.fromRGBO(180, 189, 196, 1);
  static Color cardColor = const Color.fromRGBO(232, 241, 255, 1);
  static Color tealColor = const Color.fromRGBO(22, 127, 113, 1);
  static Color hintColor = const Color.fromRGBO(80, 80, 80, 1);
  static Color activeColor = const Color.fromRGBO(255, 107, 0, 1);
  static Color progressColor = const Color.fromRGBO(252, 203, 64, 1);
  static Color readTextColor = const Color.fromRGBO(160, 164, 171, 1);
  static Color error = HexColor("#FF3737");


}
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

