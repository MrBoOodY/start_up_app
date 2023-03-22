import 'package:alfaisal_for_advertising/common/routes/route_utils.dart';
import 'package:alfaisal_for_advertising/common/utils.dart';
import 'package:alfaisal_for_advertising/features/authentication/domain/use_cases/sign_up_use_case.dart';
import 'package:alfaisal_for_advertising/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userSignUpProvider =
    ChangeNotifierProvider.autoDispose<UserSignUpProvider>((ref) {
  return UserSignUpProvider(ref.read(signUpUserUseCaseProvider));
});

class UserSignUpProvider extends ChangeNotifier {
  final SignUpUseCase _signUpUseCase;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool agree = false;
  FocusNode nameFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode confirmPasswordFocus = FocusNode();
  final formKey = GlobalKey<FormState>();

  UserSignUpProvider(this._signUpUseCase);

  toggleAgreement(bool? value) {
    agree = value!;
    notifyListeners();
  }

  signIn() async {
    if (!formKey.currentState!.validate()) return;
    Utils.showLoading();
    final result = await _signUpUseCase(
      countryId: -1,
      email: email.text,
      name: name.text,
      password: password.text,
      confirmPassword: confirmPassword.text,
      phone: phone.text,
    );
    Utils.hideLoading();
    result.fold(Utils.handleFailures, (message) async {
      RouteUtils.goToLoginPage();
      return;
    });
  }
}
