import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:start_up_app/features/authentication/data/models/user/user.dart';
import 'package:start_up_app/features/authentication/domain/repositories/auth_repository.dart';

part 'save_user_use_case.g.dart';

@riverpod
Future<void> saveUserUseCase(SaveUserUseCaseRef ref, {required User user}) {
  return ref.read(authRepositoryProvider).saveUser(user: user);
}
