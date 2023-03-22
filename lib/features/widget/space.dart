import 'package:alfaisal_for_advertising/common/extensions/screen_size_utils.dart';
import 'package:flutter/material.dart';

class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace({Key? key, required this.value}) : super(key: key);
  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (value / 100).w,
    );
  }
}

class VerticalSpace extends StatelessWidget {
  const VerticalSpace({Key? key, required this.value}) : super(key: key);
  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (value / 100).h,
    );
  }
}
