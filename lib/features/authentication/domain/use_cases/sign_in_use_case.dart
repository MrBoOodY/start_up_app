import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:start_up_app/features/authentication/domain/repositories/auth_repository.dart';

part 'sign_in_use_case.g.dart';

@riverpod
Future<void> signInUseCase(
  SignInUseCaseRef ref, {
  required String emailAddress,
  required String password,
  required int countryId,
}) {
  return ref.read(authRepositoryProvider).signIn(
        email: emailAddress,
        password: password,
        countryId: countryId,
      );
}
