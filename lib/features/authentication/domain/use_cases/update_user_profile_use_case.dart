import 'package:dartz/dartz.dart';
import 'package:alfaisal_for_advertising/common/core_data_source/failure.dart';
import 'package:alfaisal_for_advertising/features/authentication/domain/repositories/auth_repository.dart';

class UpdateUserProfileUseCase {
  final AuthRepository repository;

  UpdateUserProfileUseCase(this.repository);

  Future<Either<Failure, String>> call({
    required String name,
    required String phone,
    required String email,
    String? image,
    String? password,
    required int countryId,
    required int? cityId,
    required int? areaId,
  }) {
    return repository.updateUserProfile(
      name: name,
      email: email,
      phone: phone,
      image: image,
      areaId: areaId,
      cityId: cityId,
      countryId: countryId,
      password: password,
    );
  }
}
