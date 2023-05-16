import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:start_up_app/features/authentication/domain/repositories/auth_repository.dart';

part 'forget_password_use_case.g.dart';

@riverpod
Future<int> forgetPasswordUseCase(
  ForgetPasswordUseCaseRef ref, {
  required String mobile,
}) {
  return ref.read(authRepositoryProvider).forgetPassword(mobile: mobile);
}
