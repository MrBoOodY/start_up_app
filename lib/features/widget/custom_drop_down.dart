import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:start_up_app/common/constants/app_colors.dart';
import 'package:start_up_app/common/theme/font_manager.dart';
import 'package:start_up_app/features/widget/space.dart';

class CustomDropDown extends ConsumerWidget {
  static String? chosenValue;
  const CustomDropDown({
    Key? key,
    this.items,
    this.hint,
    this.fillColor,
    this.onSave,
    this.borderColor,
    this.validator,
    this.label,
    this.border,
    this.prefix,
    this.prefixColor = Colors.grey,
    this.verticalPadding,
    this.icon = const Icon(
      Icons.keyboard_arrow_down,
      color: AppColors.mainColor,
      size: 25,
    ),
    this.required = false,
    this.onChanged,
    this.borderRadius = 5,
    this.selectedItem,
  }) : super(key: key);
  final List<String>? items;
  final String? hint;
  final String? label;
  final bool required;
  final Color? fillColor;
  final Color? borderColor;
  final double? borderRadius;
  final Function(String?)? onSave;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final String? selectedItem;
  final Widget icon;
  final InputBorder? border;
  final double? verticalPadding;
  final dynamic prefix;
  final Color prefixColor;

  @override
  Widget build(BuildContext context, ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Row(
            children: [
              Text(
                label!,
                style: AppFontStyle.almaraiBoldStyle.copyWith(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              const HorizontalSpace(value: 1),
              if (required)
                const Icon(
                  Icons.emergency,
                ),
            ],
          ),
          const VerticalSpace(value: 1),
        ],
        DropdownButtonFormField<String>(
          icon: icon,
          iconEnabledColor: AppColors.mainColor,
          decoration: InputDecoration(
            prefixIcon: prefix == null
                ? null
                : Container(
                    margin: EdgeInsets.all(0.02.w),
                    padding: EdgeInsets.all(0.01.w),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.mainColor,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: prefix is IconData
                        ? Icon(
                            prefix!,
                            color: prefixColor,
                            size: 15,
                          )
                        : Image.asset(
                            prefix,
                            color: prefixColor,
                          ),
                  ),
            contentPadding: EdgeInsets.symmetric(
                vertical: verticalPadding ?? 15.0, horizontal: 10.0),
            focusedBorder: border ??
                OutlineInputBorder(
                    borderSide: BorderSide(
                      color: borderColor ?? AppColors.textFieldBorderColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5)),
            enabledBorder: border ??
                OutlineInputBorder(
                    borderSide: BorderSide(
                      color: borderColor ?? AppColors.textFieldBorderColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(borderRadius!)),
            border: border ??
                OutlineInputBorder(
                    borderSide: BorderSide(
                      color: borderColor ?? AppColors.textFieldBorderColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(borderRadius!)),
            disabledBorder: border ??
                OutlineInputBorder(
                    borderSide: BorderSide(
                      color: borderColor ?? AppColors.textFieldBorderColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(borderRadius!)),
            errorBorder: border ??
                OutlineInputBorder(
                    borderSide: BorderSide(
                      color: borderColor ?? AppColors.textFieldBorderColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(borderRadius!)),
            fillColor: fillColor ?? AppColors.textFieldBorderColor,
            filled: fillColor != null,
          ),
          value:
              selectedItem, // foundInList() ? CustomDropDownlogin.chosenValue : null,
          items: items?.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(
                value,
                style: AppFontStyle.almaraiRegularStyle.copyWith(
                  color: AppColors.textColor,
                  fontSize: 15,
                ),
              ),
            );
          }).toList(),

          hint: hint == null
              ? null
              : Text(
                  hint!,
                  style: AppFontStyle.almaraiBoldStyle.copyWith(
                    fontSize: 15,
                    color: const Color(0xff5B5B5B),
                  ),
                ),
          onChanged: onChanged,
          onSaved: onSave,
          validator: validator,
        ),
      ],
    );
  }
}
