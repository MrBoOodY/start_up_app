import 'package:flutter/material.dart';
import 'package:alfaisal_for_advertising/common/constants/app_colors.dart';
import 'package:alfaisal_for_advertising/common/theme/font_manager.dart';
import 'package:alfaisal_for_advertising/common/utils.dart';
import 'package:alfaisal_for_advertising/features/widget/custom_button.dart';
import 'package:alfaisal_for_advertising/features/widget/custom_text.dart';
import 'package:lottie/lottie.dart';

class LottieConfirmationDialog extends StatelessWidget {
  const LottieConfirmationDialog({
    Key? key,
    this.lottieFile,
    required this.title,
    required this.onConfirm,
  }) : super(key: key);

  final String? lottieFile;
  final String title;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (lottieFile != null) ...[
          LottieBuilder.asset(lottieFile!),
          const SizedBox(height: 20.0),
        ],
        CustomText(title),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
                color: MyColors.mainColor,
                elevation: 2,
                child: CustomText(
                  Utils.localization?.no,
                  style: AppFontStyle.tajawalMediumStyle.copyWith(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Utils.hideCustomDialog(name: title);
                }),
            const SizedBox(width: 20.0),
            CustomButton(
              color: MyColors.backgroundColor,
              elevation: 2,
              onPressed: () {
                Utils.hideCustomDialog(name: title);
                onConfirm();
              },
              child: CustomText(
                Utils.localization?.yes,
                style: AppFontStyle.tajawalMediumStyle
                    .copyWith(color: Colors.black),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
