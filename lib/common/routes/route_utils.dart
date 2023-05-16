import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:start_up_app/common/routes/route_strings.dart';
import 'package:start_up_app/common/routes/routes.dart';

part 'route_utils.g.dart';

@riverpod
class RouteUtils extends _$RouteUtils {
  @override
  Raw<GoRouter> build() {
    return ref.watch(routerProvider);
  }

  void goToSignInPage() {
    state.goNamed(RouteStrings.instance.signIn);
  }
}
