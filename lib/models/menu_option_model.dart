import 'package:flutter/material.dart';

// Model class to hold menu option data (language and theme)
class MenuOptionsModel {
  String key;
  String value;
  IconData? icon;

  MenuOptionsModel({required this.key, required this.value, this.icon});
}
