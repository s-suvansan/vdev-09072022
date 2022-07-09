import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<void> setString({required String key, required String value}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<String> getString({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(key);
    return value ?? "";
  }

  static Future<void> removeString({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
