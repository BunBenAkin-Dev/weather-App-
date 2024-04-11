import 'package:shared_preferences/shared_preferences.dart';

class LocationStorage {
  static const key = 'Locate';

  static Future<void> saveLocation(String locay) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, locay);
      print(locay);
    } catch (e) {
      print("error saving location");
    }
  }

  static Future<String?> getLocation() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(key);
    } catch (e) {
      print('error getting Location');
    }
  }
}
