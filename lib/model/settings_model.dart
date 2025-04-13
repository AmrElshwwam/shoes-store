import 'package:flutter/widgets.dart';

class SettingsModel {
  IconData icon;
  String title;
  Widget? screen;

  SettingsModel({required this.icon, required this.title, this.screen});
}
