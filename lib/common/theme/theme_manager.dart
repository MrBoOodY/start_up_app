import 'package:alfaisal_for_advertising/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'font_manager.dart';

ThemeData get applicationTheme => ThemeData(
      scaffoldBackgroundColor: MyColors.backgroundColor,

      // Main Color
      primaryColor: MyColors.mainColor,

      primaryColorDark: Colors.black,
      disabledColor: Colors.grey,

      // AppBar Theme

      appBarTheme: AppBarTheme(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: AppFontStyle.tajawalMediumStyle,
        centerTitle: true,
      ),

      // Elevated Button Theme

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: AppFontStyle.tajawalRegularStyle,
          backgroundColor: MyColors.mainColor,
        ),
      ),

      // Text Theme

      textTheme: TextTheme(
        bodySmall: AppFontStyle.tajawalRegularStyle,
      ),
    );
