import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:start_up_app/features/authentication/domain/repositories/auth_repository.dart';

part 'edit_profile_name_use_case.g.dart';

@riverpod
Future<String> editProfileNameUseCase(EditProfileNameUseCaseRef ref,
    {required String userName}) {
  return ref.read(authRepositoryProvider).editProfileName(
        name: userName,
      );
}
