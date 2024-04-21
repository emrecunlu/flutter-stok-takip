import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastHelper {
  static Future<bool?> buildToast({
    required String message,
    required Color bgColor,
    required Color textColor,
  }) async {
    return await Fluttertoast.showToast(
      msg: message,
      backgroundColor: bgColor,
      textColor: textColor,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static Future<bool?> success(String message) async {
    return await buildToast(
      message: message,
      bgColor: Colors.green,
      textColor: Colors.white,
    );
  }
}
