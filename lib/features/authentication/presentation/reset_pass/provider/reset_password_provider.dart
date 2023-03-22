import 'package:alfaisal_for_advertising/common/routes/route_utils.dart';
import 'package:alfaisal_for_advertising/common/routes/routes.dart';
import 'package:alfaisal_for_advertising/common/utils.dart';
import 'package:alfaisal_for_advertising/features/authentication/domain/use_cases/reset_password_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final resetPasswordProvider = Provider.autoDispose(
    (ref) => ResetPasswordProvider(ref.read(resetPasswordUserUseCase)));

class ResetPasswordProvider {
  final ResetPasswordUseCase _resetPasswordUserUseCase;
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  FocusNode passwordFocus = FocusNode();
  FocusNode confirmPasswordFocus = FocusNode();
  final formKey = GlobalKey<FormState>();
  ResetPasswordProvider(
    this._resetPasswordUserUseCase,
  );

  Future<void> resetPassword({required int userId}) async {
    FocusScope.of(Routes.context).unfocus();
    if (!formKey.currentState!.validate()) {
      return;
    }

    Utils.showLoading();
    final result = await _resetPasswordUserUseCase(
      userId: userId,
      password: password.text,
    );
    Utils.hideLoading();
    result.fold(Utils.handleFailures, (message) {
      Utils.showToast(message);
      RouteUtils.goToLoginPage();
    });
  }
}
