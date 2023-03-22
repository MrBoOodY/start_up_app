import 'package:dartz/dartz.dart';
import 'package:alfaisal_for_advertising/common/core_data_source/failure.dart';
import 'package:alfaisal_for_advertising/features/authentication/domain/repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<Either<Failure, String>> call({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
    required int countryId,
  }) async {
    return repository.signUp(
      name: name,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      countryId: countryId,
      phone: phone,
    );
  }
}
