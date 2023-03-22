import 'package:flutter/material.dart';

class FontConstants { 
  static const String almaraiFontFamily = 'Almarai';
 
}

class FontWeightManger { 
  static const FontWeight almaraiFontWeightExtraLight = FontWeight.w200;
  static const FontWeight almaraiFontWeightLight = FontWeight.w300;
  static const FontWeight almaraiFontWeightRegular = FontWeight.normal;

  static const FontWeight almaraiFontWeightBold = FontWeight.w700; 
}

class AppFontStyle { 
 
  /// [FontWeight.w200]  
  static TextStyle almaraiExtraLightStyle = const TextStyle(
    fontFamily: FontConstants.almaraiFontFamily, 
    fontWeight: FontWeightManger.almaraiFontWeightExtraLight, 
  );
 
  /// [FontWeight.w300] 
  static TextStyle almaraiLightStyle = const TextStyle(
    fontFamily: FontConstants.almaraiFontFamily, 
    fontWeight: FontWeightManger.almaraiFontWeightLight, 
  );
  
  /// [FontWeight.w400]
  ///
  /// [FontWeight.normal] 
  static TextStyle almaraiRegularStyle = const TextStyle(
     
    fontFamily: FontConstants.almaraiFontFamily, 
    fontWeight: FontWeightManger.almaraiFontWeightRegular, 
     
  );

  /// [FontWeight.w700]
  static TextStyle almaraiBoldStyle = const TextStyle( 
    fontFamily: FontConstants.almaraiFontFamily, 
    fontWeight: FontWeightManger.almaraiFontWeightBold,  
  );

}
