import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> _globalKey = GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> get globalKey => _globalKey;

  static Future<void> push(Widget page) async {
    await _globalKey.currentState!.push(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static void goBack() async {
    if (_globalKey.currentState!.canPop()) {
      _globalKey.currentState!.pop();
    }
  }
}
