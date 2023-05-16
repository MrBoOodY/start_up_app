import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:start_up_app/features/authentication/data/models/user/user.dart';
import 'package:start_up_app/features/authentication/domain/repositories/auth_repository.dart';

part 'get_user_profile_use_case.g.dart';

@riverpod
Future<User> getUserProfileUseCase(GetUserProfileUseCaseRef ref) {
  return ref.read(authRepositoryProvider).getUserProfile();
}
