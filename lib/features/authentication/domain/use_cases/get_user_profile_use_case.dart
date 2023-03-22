import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alfaisal_for_advertising/common/core_data_source/failure.dart';
import 'package:alfaisal_for_advertising/features/authentication/data/models/user/user.dart';
import 'package:alfaisal_for_advertising/features/authentication/domain/repositories/auth_repository.dart';
import 'package:alfaisal_for_advertising/injection/injection.dart';

final getUserProfileUseCase =
    Provider.autoDispose<GetUserProfileUseCase>((ref) {
  return GetUserProfileUseCase(repository: ref.read(authRepositoryProvider));
});

class GetUserProfileUseCase {
  final AuthRepository repository;

  GetUserProfileUseCase({required this.repository});

  Future<Either<Failure, User>> call() {
    return repository.getUserProfile();
  }
}
