import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:start_up_app/features/authentication/domain/repositories/auth_repository.dart';
part 'verify_code_use_case.g.dart';

@riverpod
Future<void> verifyCodeUseCase(VerifyCodeUseCaseRef ref,
    {required int userId, required String code}) {
  return ref
      .read(authRepositoryProvider)
      .verifyCode(userId: userId, code: code);
}
