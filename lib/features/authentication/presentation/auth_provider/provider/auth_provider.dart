import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:start_up_app/common/core_data_source/hive/hive_helper.dart';
import 'package:start_up_app/common/routes/route_utils.dart';
import 'package:start_up_app/features/authentication/domain/use_cases/get_current_user_use_case.dart';
import 'package:start_up_app/features/authentication/domain/use_cases/is_logged_in_use_case.dart';
import 'package:start_up_app/features/authentication/presentation/auth_provider/state/auth_provider_state.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  @override
  AuthProviderState build() => const AuthProviderState();

  /// clear user
  resetUser() async {
    ref.read(routeUtilsProvider.notifier).goToSignInPage();
    ref.read(hiveHelperProvider).resetUser();
  }

  /// get user
  Future<void> getCurrentUser() async {
    if (!state.isLoggedIn) return;
    state =
        state.copyWith(currentUser: ref.read(getCurrentUserUseCaseProvider));
  }

  Future<void> getLoginStatus() async {
    state = state.copyWith(
        isLoggedIn: await ref.read(isLoggedInUseCaseProvider.future));
  }
}
