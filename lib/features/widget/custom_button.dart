import 'package:flutter/material.dart';
import 'package:start_up_app/common/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    this.height,
    required this.onPressed,
    this.child,
    this.width,
    this.borderColor,
    this.color = AppColors.mainColor,
    Key? key,
    this.borderRadius = 10,
    this.elevation,
  }) : super(key: key);
  final VoidCallback? onPressed;
  final double? height;
  final double borderRadius;
  final double? width;
  final Color? color;
  final Color? borderColor;

  final double? elevation;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: borderColor != null
                ? BorderSide(
                    color: borderColor!,
                    width: 1.5,
                  )
                : BorderSide.none,
          ),
          padding: const EdgeInsets.all(8),
          backgroundColor: color,
          elevation: elevation ?? 0,
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
