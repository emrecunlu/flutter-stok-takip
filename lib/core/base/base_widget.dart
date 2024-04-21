import 'package:flutter/material.dart';

abstract class BaseWidget<T extends StatefulWidget> extends State<T> {
  ThemeData get themeData => Theme.of(context);

  double dynamicHeight(double value) =>
      value * MediaQuery.of(context).size.height * value;
  double dynamicWidth(double value) =>
      value * MediaQuery.of(context).size.width * value;

  Widget verticalMargin(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget horizontalMargin(double height) {
    return SizedBox(
      height: height,
    );
  }
}
