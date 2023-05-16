import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:start_up_app/features/authentication/domain/repositories/auth_repository.dart';

part 'update_user_profile_use_case.g.dart';

@riverpod
Future<String> updateUserProfileUseCase(
  UpdateUserProfileUseCaseRef ref, {
  required String userName,
  required String phone,
  required String email,
  String? image,
  String? password,
  required int countryId,
  required int? cityId,
  required int? areaId,
}) {
  return ref.read(authRepositoryProvider).updateUserProfile(
        name: userName,
        email: email,
        phone: phone,
        image: image,
        areaId: areaId,
        cityId: cityId,
        countryId: countryId,
        password: password,
      );
}
