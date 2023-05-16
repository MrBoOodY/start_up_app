// 🎯 Dart imports:
import 'package:flutter/material.dart';
// 🐦 Flutter imports:
import 'package:start_up_app/common/constants/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key, this.color = AppColors.mainColor})
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
