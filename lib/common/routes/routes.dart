import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:start_up_app/common/routes/route_strings.dart';
import 'package:start_up_app/features/authentication/presentation/auth_provider/provider/auth_provider.dart';

part 'routes.g.dart';

@riverpod
BuildContext context(ContextRef ref) {
  return ref.watch(routerProvider).routerDelegate.navigatorKey.currentContext!;
}

@riverpod
Raw<GoRouter> router(RouterRef ref) {
  final isLoggedIn =
      ref.watch(authProvider.select((value) => value.isLoggedIn));
  return GoRouter(
    routes: <GoRoute>[
      GoRoute(
        name: RouteStrings.instance.initial,
        path: RouteStrings.instance.initial,
        redirect: (context, state) {
          return isLoggedIn
              ? RouteStrings.instance.home
              : RouteStrings.instance.signIn;
        },
      ),
    ],
  );
}
