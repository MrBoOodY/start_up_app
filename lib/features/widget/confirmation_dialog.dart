import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alfaisal_for_advertising/common/constants/app_colors.dart';
import 'package:alfaisal_for_advertising/common/utils.dart';
import 'package:alfaisal_for_advertising/features/widget/custom_button.dart';
import 'package:alfaisal_for_advertising/features/widget/custom_text.dart';
import 'package:lottie/lottie.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.onConfirm,
  }) : super(key: key);

  final String imagePath;
  final String title;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (imagePath.contains('json'))
            LottieBuilder.asset(imagePath)
          else
            Image.asset(
              imagePath,
              width: 0.2.w,
              height: 0.1.h,
            ),
          CustomText(title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15, color: Colors.black)),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                  color: AppColors.mainColor,
                  elevation: 2,
                  child: CustomText(
                    Utils.localization?.no,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                  ),
                  onPressed: () {
                    Utils.hideCustomDialog(name: title);
                  }),
              const SizedBox(width: 20.0),
              CustomButton(
                color: AppColors.backgroundColor,
                elevation: 2,
                onPressed: () {
                  Utils.hideCustomDialog(name: title);
                  onConfirm();
                },
                child: CustomText(
                  Utils.localization?.yes,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
