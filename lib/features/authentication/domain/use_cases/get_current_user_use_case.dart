import 'package:dartz/dartz.dart';
import 'package:alfaisal_for_advertising/common/core_data_source/failure.dart';
import 'package:alfaisal_for_advertising/features/authentication/data/models/user/user.dart';
import 'package:alfaisal_for_advertising/features/authentication/domain/repositories/auth_repository.dart';

class GetCurrentUserUseCase {
  final AuthRepository repository;

  GetCurrentUserUseCase(this.repository);

  Either<Failure, User?> call() {
    return repository.getCurrentUser();
  }
}
