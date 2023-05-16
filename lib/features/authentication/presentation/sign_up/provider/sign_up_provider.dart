import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:start_up_app/common/extensions/async_value_extension.dart';
import 'package:start_up_app/common/routes/route_utils.dart';
import 'package:start_up_app/common/utils.dart';
import 'package:start_up_app/features/authentication/domain/use_cases/sign_up_use_case.dart';

part 'sign_up_provider.g.dart';

@riverpod
class SignUpController extends _$SignUpController {
  @override
  void build() {
    return;
  }

  signIn({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
    required int countryId,
  }) async {
    final utils = ref.read(utilsProvider);
    utils.showLoading();
    final result = await AsyncValue.guard(() => ref.read(signUpUseCaseProvider(
          countryId: -1,
          email: email,
          userName: name,
          password: password,
          confirmPassword: confirmPassword,
          phone: phone,
        ).future));
    utils.hideLoading();
    result.handleErrorOrData(
        handleData: () {
          ref.read(routeUtilsProvider.notifier).goToSignInPage();
        },
        ref: ref);
  }
}
