import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:start_up_app/features/authentication/data/models/user/user.dart';
import 'package:start_up_app/features/authentication/domain/repositories/auth_repository.dart';

part 'get_current_user_use_case.g.dart';

@riverpod
User getCurrentUserUseCase(GetCurrentUserUseCaseRef ref) {
  return ref.read(authRepositoryProvider).getCurrentUser();
}
