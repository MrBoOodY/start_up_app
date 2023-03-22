// 🎯 Dart imports:
// 🐦 Flutter imports:
import 'package:alfaisal_for_advertising/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key, this.color = MyColors.mainColor})
      : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
