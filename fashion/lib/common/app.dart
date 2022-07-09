import 'package:fashion/common/key.dart';
import 'package:fashion/common/local_storage.dart';

class App {
  static String formattedDateTime(String? date) {
    try {
      List<String> months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
      DateTime dateTime = DateTime.parse(date ?? DateTime.now().toIso8601String());
      int hours = dateTime.hour > 12
          ? dateTime.hour - 12
          : dateTime.hour != 0
              ? dateTime.hour
              : 12;
      String timeInFormat = "$hours:${dateTime.minute} ${dateTime.hour > 12 ? "PM" : "AM"}";
      String dateInFormat = "${months[dateTime.month - 1]}-${dateTime.day} $timeInFormat";
      return dateInFormat;
    } catch (e) {
      return "";
    }
  }

  static Future<void> setUserLoginStatus(String value) async {
    await LocalStorage.setString(key: userLoginStatus, value: value);
  }

  static Future<String> getUserLoginStatus() async {
    String value = await LocalStorage.getString(key: userLoginStatus);
    return value;
  }

  static Future<void> removeUserLoginStatus() async {
    await LocalStorage.removeString(key: userLoginStatus);
  }
}
