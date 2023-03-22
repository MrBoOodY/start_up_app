// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:alfaisal_for_advertising/common/routes/route_utils.dart';
import 'package:alfaisal_for_advertising/injection/injection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_provider.g.dart';

@riverpod
class SplashNotifier extends _$SplashNotifier {
  @override
  void build() => startTimer();

  Future<void> startTimer() async {
    navigate();
  }

  navigate() async {
    if (await ref.read(isLoggedInUseCaseProvider).call()) {
      RouteUtils.goToHomePage();
    } else {
      RouteUtils.goToLoginPage();
    }
  }
}
