import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:start_up_app/common/extensions/async_value_extension.dart';
import 'package:start_up_app/common/routes/route_utils.dart';
import 'package:start_up_app/common/utils.dart';
import 'package:start_up_app/features/authentication/domain/use_cases/reset_password_use_case.dart';

part 'reset_password_provider.g.dart';

@riverpod
class ResetPasswordProvider extends _$ResetPasswordProvider {
  @override
  void build() {
    return;
  }

  Future<void> resetPassword(
      {required int userId, required String password}) async {
    final utils = ref.read(utilsProvider);
    utils.showLoading();
    final result =
        await AsyncValue.guard(() => ref.read(resetPasswordUseCaseProvider(
              userId: userId,
              password: password,
            ).future));
    utils.hideLoading();
    result.handleErrorOrData(
        handleData: () {
          utils.showToast(result.value ?? '');
          ref.read(routeUtilsProvider.notifier).goToSignInPage();
        },
        ref: ref);
  }
}
