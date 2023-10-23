import 'package:shared_preferences/shared_preferences.dart';

class PreferenceData {

  static Future<String?> getData(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<bool?> setData(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }
}
