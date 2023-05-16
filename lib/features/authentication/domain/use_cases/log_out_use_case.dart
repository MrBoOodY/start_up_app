import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:start_up_app/features/authentication/domain/repositories/auth_repository.dart';

part 'log_out_use_case.g.dart';

@riverpod
Future<void> logOutUseCase(LogOutUseCaseRef ref) {
  return ref.read(authRepositoryProvider).logOut();
}
