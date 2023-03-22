import 'package:alfaisal_for_advertising/common/constants/app_colors.dart';
import 'package:alfaisal_for_advertising/common/constants/assets.dart';
import 'package:flutter/material.dart';

class SplashImage extends StatelessWidget {
  const SplashImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mainColor,
      body: Center(
        child: Image.asset(
          ImagesAssets.splash,
        ),
      ),
    );
  }
}
