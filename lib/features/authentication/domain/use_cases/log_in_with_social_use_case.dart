import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:start_up_app/features/authentication/data/models/user/user.dart';
import 'package:start_up_app/features/authentication/domain/repositories/auth_repository.dart';

part 'log_in_with_social_use_case.g.dart';

@riverpod
Future<User> logInWithSocialUseCase(
  LogInWithSocialUseCaseRef ref, {
  required String userName,
  required String phone,
  required String email,
  required String password,
  required int countryId,
}) {
  return ref.read(authRepositoryProvider).loginWithSocial(
      name: userName,
      phone: phone,
      email: email,
      password: password,
      countryId: countryId);
}
