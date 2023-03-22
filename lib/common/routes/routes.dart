import 'package:alfaisal_for_advertising/common/routes/route_strings.dart';
import 'package:alfaisal_for_advertising/features/on_boarding/presentation/splash/page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static BuildContext get context =>
      router.routerDelegate.navigatorKey.currentContext!;

  static final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        name: RouteStrings.splashPage,
        path: RouteStrings.splashPage,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashPage();
        },
      ),
      GoRoute(
        name: RouteStrings.login,
        path: RouteStrings.login,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashPage();
        },
      ),
      GoRoute(
        name: RouteStrings.home,
        path: RouteStrings.home,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashPage();
        },
      ),
    ],
  );
}
