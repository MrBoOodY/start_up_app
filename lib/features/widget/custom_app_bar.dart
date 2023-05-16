import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:start_up_app/common/constants/app_colors.dart';
import 'package:start_up_app/common/theme/font_manager.dart';
import 'package:start_up_app/features/widget/custom_back_button.dart';
import 'package:start_up_app/features/widget/custom_text.dart';
import 'package:start_up_app/features/widget/space.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    this.backgroundColor,
    this.isRoundedBackButton = false,
    this.title,
    this.titleColor,
    this.actions,
    this.leading,
    this.fontSize,
    this.isReversedBackButton = false,
    Key? key,
  }) : super(key: key);
  final Color? backgroundColor;
  final String? title;
  final Color? titleColor;
  final bool isReversedBackButton;
  final bool isRoundedBackButton;
  final double? fontSize;
  final List<Widget>? actions;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: SizedBox(
        height: kToolbarHeight * 3,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.mainColor,
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          child: isReversedBackButton
              ? Padding(
                  padding: EdgeInsets.only(top: 0.05.h),
                  child: Row(
                    children: [
                      const Spacer(
                        flex: 3,
                      ),
                      if (title != null)
                        CustomText(
                          title,
                          style: AppFontStyle.almaraiBoldStyle.copyWith(
                            fontSize: fontSize ?? 15,
                            color: titleColor ?? Colors.white,
                          ),
                        ),
                      const Spacer(
                        flex: 2,
                      ),
                      if (leading != null)
                        leading!
                      else
                        CustomBackButton(
                          iconSize: 15,
                          isReversed: isReversedBackButton,
                          isRoundedBackButton: isRoundedBackButton,
                        ),
                      const HorizontalSpace(value: 2),
                    ],
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(top: 0.05.h),
                  child: Row(
                    children: [
                      const HorizontalSpace(value: 2),
                      if (leading != null)
                        leading!
                      else
                        CustomBackButton(
                          isRoundedBackButton: isRoundedBackButton,
                        ),
                      const Spacer(
                        flex: 2,
                      ),
                      if (title != null)
                        CustomText(
                          title!,
                          style: AppFontStyle.almaraiBoldStyle.copyWith(
                            fontSize: fontSize ?? 15,
                            color: titleColor ?? Colors.white,
                          ),
                        ),
                      const Spacer(
                        flex: 3,
                      ),
                      if (actions != null) ...actions!.map((e) => e)
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 1.5);
}
