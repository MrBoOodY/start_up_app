import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:start_up_app/features/authentication/domain/repositories/auth_repository.dart';

part 'reset_password_use_case.g.dart';

@riverpod
Future<String> resetPasswordUseCase(
  ResetPasswordUseCaseRef ref, {
  required int userId,
  required String password,
}) {
  return ref.read(authRepositoryProvider).resetPassword(
        userId: userId,
        password: password,
      );
}
