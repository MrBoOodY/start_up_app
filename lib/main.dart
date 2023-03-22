import 'package:alfaisal_for_advertising/common/core_data_source/start_up_functionality/start_up_functionality.dart';
import 'package:alfaisal_for_advertising/common/routes/routes/routes.dart';
import 'package:alfaisal_for_advertising/common/theme/theme_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:requests_inspector/requests_inspector.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // if (DateTime.now().compareTo(DateTime(2023, 3, 25)) < 0) {
  runApp(ProviderScope(
    child: RequestsInspector(
      enabled: kDebugMode,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return Consumer(
            builder: (context, ref, child) {
              final startUp = ref.watch(startUpFunctionalityProvider);

              if (startUp.isLoading) {
                FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
              }
              FlutterNativeSplash.remove();

              return const MyApp();
            },
          );
        },
      ),
    ),
  ));
  // } else {
  //   runApp(const ProviderScope(child: MaterialApp()));
  // }
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /*   ref.listen(languageNotifierProvider, (previous, next) {
      if (previous?.isArabic != next.isArabic) {
        void rebuild(Element el) {
          el.markNeedsBuild();
          el.visitChildren(rebuild);
        }

        (context as Element).visitChildren(rebuild);
      }
    }); */
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
      routerConfig: ref.watch(routerProvider),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // locale: ref.watch(languageNotifierProvider).locale,
      theme: applicationTheme,
    );
  }
}
