import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alfaisal_for_advertising/common/constants/app_colors.dart';
import 'package:alfaisal_for_advertising/common/constants/validator.dart';
import 'package:alfaisal_for_advertising/common/extensions/screen_size_utils.dart';
import 'package:alfaisal_for_advertising/common/theme/font_manager.dart';
import 'package:alfaisal_for_advertising/features/widget/space.dart';

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
                    style: AppFontStyle.tajawalStyleNormal.copyWith(
                      color: Colors.black,
                      fontSize: 15.femW,
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
              style: AppFontStyle.tajawalRegularStyle.copyWith(
                color: Colors.black,
                fontSize: FontConstants.fontSize05.r,
              ),
              onEditingComplete: onEditingComplete,
              cursorColor: MyColors.mainColor,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: contentPaddingH ?? 20,
                  vertical: contentPaddingV ?? 0,
                ),
                hintText: hint,
                hintStyle: AppFontStyle.tajawalRegularStyle.copyWith(
                  fontSize: 15.femW,
                  color: hintColor ?? const Color(0xff5B5B5B),
                ),
                suffixIcon: suffix,
                prefixIcon: prefix,
                filled: true,
                fillColor: backgroundColor ?? Colors.white,
                focusedBorder: border ??
                    OutlineInputBorder(
                        borderSide: BorderSide(
                          color: borderColor ?? MyColors.textFieldBorderColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                enabledBorder: border ??
                    OutlineInputBorder(
                        borderSide: BorderSide(
                          color: borderColor ?? MyColors.textFieldBorderColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                border: border ??
                    OutlineInputBorder(
                        borderSide: BorderSide(
                          color: borderColor ?? MyColors.textFieldBorderColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ],
        );
      },
    );
  }
}
