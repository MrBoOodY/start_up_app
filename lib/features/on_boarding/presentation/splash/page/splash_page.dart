import 'package:alfaisal_for_advertising/features/on_boarding/presentation/splash/provider/splash_provider.dart';
import 'package:alfaisal_for_advertising/features/on_boarding/presentation/splash/widgets/splash_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(splashNotifierProvider);

    return const SplashImage();
  }
}
