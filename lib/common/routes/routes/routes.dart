import 'package:alfaisal_for_advertising/common/routes/route_strings.dart';
import 'package:alfaisal_for_advertising/features/authentication/presentation/auth_provider/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final _key = GlobalKey<NavigatorState>();

BuildContext get appContext => _key.currentContext!;
final routerProvider = Provider<GoRouter>(
  (ref) {
    final isLoggedIn =
        ref.watch(authProvider.select((value) => value.isLoggedIn));

    return GoRouter(
      navigatorKey: _key,
      routes: <GoRoute>[
        GoRoute(
          name: RouteStrings.initial,
          path: RouteStrings.initial,
          redirect: (context, state) {
            final isInitial = state.location == RouteStrings.initial;
            // if (isInitial) {
            //   return isLoggedIn ? RouteStrings.home : RouteStrings.language;
            // }
            return RouteStrings.signIn;
            // return null;
          },
        ),
      ],
    );
  },
);
