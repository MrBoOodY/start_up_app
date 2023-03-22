import 'package:alfaisal_for_advertising/common/core_data_source/hive_helper/hive_helper.dart';
import 'package:alfaisal_for_advertising/common/routes/route_utils.dart';
import 'package:alfaisal_for_advertising/common/utils.dart';
import 'package:alfaisal_for_advertising/features/authentication/presentation/auth_provider/state/auth_provider_state.dart';
import 'package:alfaisal_for_advertising/injection/injection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  @override
  AuthProviderState build() => const AuthProviderState();

  /// clear user
  static resetUser() async {
    RouteUtils.goToLoginPage();
    HiveHelper().resetUser();
  }

  /// get user
  void getCurrentUser() {
    if (!state.isLoggedIn) return;
    final result = ref.read(getCurrentUserUseCaseProvider).call();
    result.fold(Utils.handleFailures, (user) {
      state = state.copyWith(currentUser: user);
    });
  }

  Future<void> getLoginStatus() async {
    state = state.copyWith(
        isLoggedIn: await ref.read(isLoggedInUseCaseProvider).call());
  }
}
