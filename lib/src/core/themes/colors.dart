import 'package:flutter/material.dart';

/// All the colors used in the application are defined here
/// Update the colors as desired with their dark mode variations below them.
abstract class AppColors {
  // objects Colors
  static const Color primaryColor = Color(0xFF794fd6);
  static const Color secondaryColor = Color(0xFF12101e);
  static const Color thirdColor = Color(0xFF999999);

  static const Color iconButtonIconColor = primaryColor;

  // background Colors
  static const Color backgroundColor = Color(0XFF12101e);
  static const Color appBarBackGroundColor = Colors.white;
  static const Color navBarBackgroundColor = Color(0xFF323539);
  static const Color moodPreviewBackGroundColor = Color(0XFF33215a);
  static const Color moodNumberBackGroundColor = Color(0xFF1A1A2E);

  // text colors
  static const Color labelTextColor = Colors.black;
  static const Color headlineTextColor = Color(0xFF8E8E93);
  static const Color buttonTextColor = Color(0xFF1D1D1D);
  static const Color bodyGreyTextColor = Color(0xFF737373);
  static const Color bodyTextColor = Color(0xFF181818);
  static const Color tileTextColor = Color(0xFF333333);
  static const Color dateTextColor = Color(0xFF999999);

  static const Color titleTextColor = Color(0XFF1D1D1D);
  static const Color errorTextColor = Color(0xFFFF0E0E);

  // border colors
  static const Color borderColor = Color(0XFF4f3c70);

  // other colors
  static const Color dividerColor = Color(0xFFDADADA);

  //mods colors
  static const Color moodHappyColor = Color(0xFF11aa79);
  static const Color moodEcstaticColor = Color(0xFFFFB300);
  static const Color moodAwfulColor = Color(0xFFE53935);
  static const Color moodSadColor = Color(0xFF8E24AA);
  static const Color moodNeutralColor = Color(0xFF1E88E5);
}
