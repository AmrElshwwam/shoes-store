import 'package:flutter/material.dart';
import 'package:shoes_store/model/settings_model.dart';
import 'package:shoes_store/view/screens/about_screen.dart';
import 'package:shoes_store/view/screens/help_screen.dart';
import 'package:shoes_store/view/screens/invite_friends_screen.dart';
import 'package:shoes_store/view/screens/language_screen.dart';
import 'package:shoes_store/view/screens/notifications_screen.dart';
import 'package:shoes_store/view/screens/privacy_screen.dart';

List<SettingsModel> dataSettings = [
  SettingsModel(
    icon: Icons.light_mode_outlined,
    title: "light_Mode",
  ),
  SettingsModel(
    icon: Icons.language,
    title: "language",
    screen: LanguageScreen(),
  ),
  SettingsModel(
    icon: Icons.notifications_none,
    title: "notifications",
    screen: NotificationsScreen(),
  ),
  SettingsModel(
    icon: Icons.share,
    title: "invite_friends",
    screen: InviteFriendsScreen(),
  ),
  SettingsModel(
    icon: Icons.privacy_tip,
    title: "privacy_policy",
    screen: PrivacyScreen(),
  ),
  SettingsModel(
    icon: Icons.info_outline,
    title: "about_us",
    screen: AboutScreen(),
  ),
  SettingsModel(
    icon: Icons.help,
    title: "help",
    screen: HelpScreen(),
  ),
];
