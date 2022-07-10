import 'package:fashion/common/key.dart';
import 'package:fashion/common/local_storage.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';

class App {
  static String price(dynamic price) {
    try {
      return "Rs.${price.toStringAsFixed(2)}";
    } catch (e) {
      return "";
    }
  }

  static String rating(Rating? rating) {
    try {
      if (rating?.count != null && rating?.count != 0) {
        return "${rating?.rate.toDouble() ?? 0.0} (${rating?.count})";
      } else {
        return "";
      }
    } catch (e) {
      return "";
    }
  }

  static String capitalize(String text) {
    try {
      return "${text[0].toUpperCase()}${text.substring(1).toLowerCase()}";
    } catch (e) {
      return text;
    }
  }

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

  static Future<dynamic> showCommonPopup(BuildContext context, Widget widget, {boolbarrierDismissible = true}) async {
    dynamic value;
    value = await showDialog(
        barrierDismissible: boolbarrierDismissible,
        context: context,
        builder: (BuildContext bc) {
          return widget;
        });
    return value;
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
