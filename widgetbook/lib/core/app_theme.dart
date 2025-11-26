import 'package:flutter/material.dart';

final class AppTheme {
  static const backgroundColor = Color(0xffE8E8E3);
  static const darkColor = Color(0xff0E0F10);
  static const tagLine = Color(0xff808080);
  static const cardBackgroundColor = Color(0xffF1F1EF);
  static const cardShadowGlowColor = Color(0xff7E52F4);

  static ThemeData get light =>
      ThemeData.light().copyWith(scaffoldBackgroundColor: backgroundColor);

  static ThemeData get dark =>
      ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor);
}
