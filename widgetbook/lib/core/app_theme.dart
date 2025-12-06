import 'package:flutter/material.dart';

final class AppTheme {
  static const backgroundColor = Color(0xffE8E8E3);
  static const darkColor = Color(0xff0E0F10);
  static const tagLine = Color(0xff808080);
  static const cardBackgroundColor = Color(0xffF1F1EF);
  static const cardShadowGlowColor = Color(0xff7E52F4);

  static const _fontFamily = 'AktivGrotesk';

  static const _textThemeData = TextTheme(
    titleMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 20,
      color: darkColor,
    ),
    bodyMedium: TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: darkColor,
    ),
    bodySmall: TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: tagLine,
    ),
  );

  static ThemeData get light => ThemeData.light().copyWith(
    scaffoldBackgroundColor: backgroundColor,
    textTheme: _textThemeData,
  );

  static ThemeData get dark => ThemeData.dark().copyWith(
    scaffoldBackgroundColor: backgroundColor,
    textTheme: _textThemeData,
  );
}
