import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:start_up_app/common/constants/app_colors.dart';

import 'font_manager.dart';

ThemeData get applicationTheme => ThemeData(
      scaffoldBackgroundColor: AppColors.backgroundColor,

      // Main Color
      primaryColor: AppColors.mainColor,

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
        titleTextStyle: AppFontStyle.almaraiBoldStyle,
        centerTitle: true,
      ),

      // Elevated Button Theme

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: AppFontStyle.almaraiRegularStyle,
          backgroundColor: AppColors.mainColor,
        ),
      ),

      // Text Theme

      textTheme: TextTheme(
        bodySmall: AppFontStyle.almaraiRegularStyle,
      ),
    );
