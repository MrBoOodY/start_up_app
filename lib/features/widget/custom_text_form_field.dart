import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:start_up_app/common/constants/app_colors.dart';
import 'package:start_up_app/common/constants/validator.dart';
import 'package:start_up_app/common/theme/font_manager.dart';
import 'package:start_up_app/features/widget/space.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.isPassword,
    this.inputType,
    this.onChanged,
    this.onSaved,
    this.focusNode,
    this.backgroundColor,
    this.onEditingComplete,
    this.maxLines,
    this.label,
    this.controller,
    this.suffix,
    this.prefix,
    this.hint,
    this.hintColor,
    this.validator,
    this.borderColor,
    this.textAlign,
    this.suffixColor,
    this.required = false,
    this.contentPaddingH,
    this.contentPaddingV,
    this.border,
    this.isNumber = false,
    this.isPrice = false,
    this.autoFoucus,
  }) : super(key: key);
  final TextEditingController? controller;
  final bool? autoFoucus;

  final double? contentPaddingH;
  final double? contentPaddingV;
  final TextInputType? inputType;
  final InputBorder? border;
  final ValueSetter? onChanged;
  final ValueSetter? onSaved;
  final FocusNode? focusNode;
  final int? maxLines;
  final bool required;
  final Color? borderColor;
  final Color? hintColor;
  final Color? suffixColor;
  final Color? backgroundColor;
  final String? label;
  final String? hint;
  final TextAlign? textAlign;
  final bool? isPassword;
  final Widget? suffix;
  final Widget? prefix;
  final bool isNumber;
  final bool isPrice;

  final FormFieldValidator<String>? validator;
  final Function()? onEditingComplete;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (label != null) ...[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label!,
                    style: AppFontStyle.almaraiRegularStyle.copyWith(
                      color: Colors.black,
                      fontSize: 15.sp,
                    ),
                  ),
                  const HorizontalSpace(value: 1),
                  if (required)
                    const SizedBox(
                      child: Icon(
                        Icons.emergency,
                      ),
                    ),
                ],
              ),
              const VerticalSpace(value: 1),
            ],
            TextFormField(
              autofocus: autoFoucus ?? false,
              validator: validator,
              controller: controller,
              focusNode: focusNode,
              obscureText: isPassword ?? false,
              keyboardType: isNumber || isPrice
                  ? TextInputType.numberWithOptions(
                      decimal: isPrice ? true : false)
                  : inputType,
              inputFormatters: isNumber || isPrice
                  ? [
                      if (isPrice) AppValidator.priceValueOnly(),
                      if (isNumber) FilteringTextInputFormatter.digitsOnly
                    ]
                  : null,
              onChanged: onChanged,
              onSaved: onSaved,
              maxLines: maxLines ?? 1,
              style: AppFontStyle.almaraiRegularStyle.copyWith(
                color: Colors.black,
                fontSize: 15,
              ),
              onEditingComplete: onEditingComplete,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: contentPaddingH ?? 20,
                  vertical: contentPaddingV ?? 0,
                ),
                hintText: hint,
                hintStyle: AppFontStyle.almaraiRegularStyle.copyWith(
                  fontSize: 15.sp,
                  color: hintColor ?? const Color(0xff5B5B5B),
                ),
                suffixIcon: suffix,
                prefixIcon: prefix,
                // filled: true,
                // fillColor: backgroundColor ?? Colors.white,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.textFieldBorderColor,
                    width: 1,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.textFieldBorderColor,
                    width: 1,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.textFieldBorderColor,
                    width: 1,
                  ),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.textFieldBorderColor,
                    width: 1,
                  ),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.textFieldBorderColor,
                    width: 1,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
