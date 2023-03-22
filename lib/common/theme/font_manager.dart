import 'package:flutter/material.dart';

class FontConstants {
  static const String tajawalFontFamily = 'Tajawal';
  static const String almaraiFontFamily = 'Almarai';

  static double fontSize06 = 0.06;
  static double fontSize055 = 0.055;
  static double fontSize045 = 0.045;
  static double fontSize04 = 0.04;
  static double fontSize05 = 0.05;
  static double fontSize02 = 0.02;
  static double fontSize03 = 0.03;
  static double fontSize035 = 0.035;
  static double iconSize065 = 0.065;
  static double iconSize035 = 0.035;
  static double iconSize085 = 0.085;
}

class FontWeightManger {
  static const FontWeight tajawalFontWeightExtraLight = FontWeight.w200;
  static const FontWeight tajawalFontWeightLight = FontWeight.w300;
  static const FontWeight tajawalFontWeightRegular = FontWeight.normal;
  static const FontWeight tajawalFontWeightMedium = FontWeight.w500;
  static const FontWeight tajawalFontWeightBold = FontWeight.w700;
  static const FontWeight tajawalFontWeightExtraBold = FontWeight.w800;
  static const FontWeight tajawalFontWeightBlack = FontWeight.w900;

  static const FontWeight almaraiFontWeightExtraLight = FontWeight.w200;
  static const FontWeight almaraiFontWeightLight = FontWeight.w300;
  static const FontWeight almaraiFontWeightRegular = FontWeight.normal;

  static const FontWeight almaraiFontWeightBold = FontWeight.w700;
  static const FontWeight almaraiFontWeightExtraBold = FontWeight.w800;
  static const FontWeight almaraiFontWeightBlack = FontWeight.w900;
}

class AppFontStyle {
  /// [FontWeight.w400]
  ///
  /// [FontWeight.normal]

  static TextStyle tajawalRegularStyle = const TextStyle(
    color: Colors.white,
    fontFamily: FontConstants.almaraiFontFamily,
    //fontFamily: FontConstants.tajawalFontFamily,
    fontWeight: FontWeightManger.almaraiFontWeightRegular,
    //fontWeight: FontWeightManger.tajawalFontWeightRegular,
    fontSize: 17,
  );

  /// [FontWeight.w500]
  static TextStyle tajawalMediumStyle = const TextStyle(
    color: Colors.white,
    fontFamily: FontConstants.almaraiFontFamily,
    //fontFamily: FontConstants.tajawalFontFamily,
    fontWeight: FontWeight.normal,
    //fontWeight: FontWeightManger.tajawalFontWeightMedium,
    fontSize: 17,
  );

  static TextStyle tajawalStyleBold = const TextStyle(
    fontFamily: FontConstants.almaraiFontFamily,
    //fontFamily: FontConstants.tajawalFontFamily,
    fontWeight: FontWeight.bold,
    //fontWeight: FontWeightManger.tajawalFontWeightMedium,
  );
  static TextStyle tajawalStyleNormal = const TextStyle(
    fontFamily: FontConstants.almaraiFontFamily,
    //fontFamily: FontConstants.tajawalFontFamily,
    fontWeight: FontWeight.normal,
    //fontWeight: FontWeightManger.tajawalFontWeightMedium,
  );
}
