import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:start_up_app/features/authentication/domain/repositories/auth_repository.dart';

part 'sign_up_use_case.g.dart';

@riverpod
Future<String> signUpUseCase(
  SignUpUseCaseRef ref, {
  required String userName,
  required String phone,
  required String email,
  required String password,
  required String confirmPassword,
  required int countryId,
}) {
  return ref.read(authRepositoryProvider).signUp(
        name: userName,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        countryId: countryId,
        phone: phone,
      );
}
