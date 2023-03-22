import 'package:dartz/dartz.dart';
import 'package:alfaisal_for_advertising/common/core_data_source/failure.dart';
import 'package:alfaisal_for_advertising/features/authentication/domain/repositories/auth_repository.dart';

class LogOutUseCase {
  final AuthRepository repository;

  LogOutUseCase(this.repository);

  Future<Either<Failure, Unit>> call() {
    return repository.logOut();
  }
}
