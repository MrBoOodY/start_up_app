import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:alfaisal_for_advertising/common/constants/app_colors.dart';
import 'package:alfaisal_for_advertising/common/extensions/screen_size_utils.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
    this.onTap,
    this.color,
    this.iconSize,
    this.isReversed = false,
    this.isRoundedBackButton = false,
  }) : super(key: key);
  final bool isReversed;
  final bool isRoundedBackButton;
  final VoidCallback? onTap;
  final Color? color;
  final double? iconSize;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? context.pop,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: EdgeInsetsDirectional.only(
            start: isReversed ? 5 : (0.020.w),
            bottom: 5,
            end: isReversed ? (0.020.w) : 5,
            top: 5),
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 2,
            ),
          ],
          shape: isRoundedBackButton ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: isRoundedBackButton
              ? null
              : BorderRadius.circular(
                  (MediaQuery.of(context).size.width >= 800 ? 0.02 : 0.03).w,
                ),
        ),
        child: Icon(
          isReversed ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
          color: MyColors.mainColor,
          size: iconSize ?? 0.06.w,
        ),
      ),
    );
  }
}
