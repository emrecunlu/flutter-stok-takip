import 'package:flutter/material.dart';

class FormHelper {
  final Map<String, TextEditingController> _fields = {};
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, TextEditingController> get fields => _fields;
  GlobalKey<FormState> get formKey => _formKey;

  FormHelper(Set<String> keys) {
    keys.forEach((element) {
      _fields[element] = TextEditingController();
    });
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    _fields.forEach((key, value) {
      json[key] = value.text;
    });

    return json;
  }

  reset() {
    _fields.forEach((key, value) {
      value.clear();
    });
  }
}
