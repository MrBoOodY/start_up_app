import 'package:alfaisal_for_advertising/common/core_data_source/failure.dart';
import 'package:alfaisal_for_advertising/features/authentication/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<Either<Failure, Unit>> call({
    required String emailAddress,
    required String password,
    required int countryId,
  }) async {
    return await repository.signIn(
      email: emailAddress,
      password: password,
      countryId: countryId,
    );
  }
}
