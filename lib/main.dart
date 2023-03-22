import 'package:alfaisal_for_advertising/common/core_data_source/start_up_functionality/start_up_functionality.dart';
import 'package:alfaisal_for_advertising/common/routes/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:requests_inspector/requests_inspector.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  runApp(ProviderScope(
    child: RequestsInspector(
      enabled: kDebugMode,
      child: Consumer(
        builder: (context, ref, child) {
          final startUp = ref.watch(startUpFunctionalityProvider);
          if (startUp.isLoading) {
            FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
          }
          FlutterNativeSplash.remove();
          return const MyApp();
        },
      ),
    ),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
      routerConfig: Routes.router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
