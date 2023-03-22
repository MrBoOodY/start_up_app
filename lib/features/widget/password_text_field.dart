import 'package:flutter/material.dart';
import 'package:alfaisal_for_advertising/features/widget/custom_text_form_field.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.hint,
    required this.label,
    required this.focusNode,
    required this.controller,
    this.validator,
    this.onEditingComplete,
  });
  final String? hint;
  final String? label;
  final FocusNode focusNode;
  final TextEditingController controller;

  final FormFieldValidator<String>? validator;
  final Function()? onEditingComplete;
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isSecure = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      label: widget.label,
      hint: widget.hint,
      required: true,
      textAlign: TextAlign.center,
      focusNode: widget.focusNode,
      controller: widget.controller,
      suffix: IconButton(
        icon: Icon(
            isSecure
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            color: Colors.grey,
            size: 20),
        onPressed: () {
          isSecure = !isSecure;
          setState(() {});
        },
      ),
      borderColor: Colors.transparent,
      isPassword: isSecure,
      validator: widget.validator,
      onEditingComplete: widget.onEditingComplete,
    );
  }
}
