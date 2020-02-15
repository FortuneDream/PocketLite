import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {
  static void set(Map<String, String> maps) {
    maps.forEach((key, value) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(key, value);
    });
  }


  static Future<String> get(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }
}
