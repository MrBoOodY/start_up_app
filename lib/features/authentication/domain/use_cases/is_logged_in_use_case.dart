import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:start_up_app/features/authentication/domain/repositories/auth_repository.dart';

part 'is_logged_in_use_case.g.dart';

@riverpod
Future<bool> isLoggedInUseCase(IsLoggedInUseCaseRef ref) {
  return ref.read(authRepositoryProvider).isLoggedIn;
}
