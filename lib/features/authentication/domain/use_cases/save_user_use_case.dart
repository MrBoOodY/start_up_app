import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alfaisal_for_advertising/features/authentication/data/models/user/user.dart';
import 'package:alfaisal_for_advertising/injection/injection.dart';

import '../../../../common/core_data_source/failure.dart';
import '../repositories/auth_repository.dart';

final saveUserUseCase = Provider.autoDispose<SaveUserUseCase>((ref) {
  return SaveUserUseCase(repository: ref.read(authRepositoryProvider));
});

class SaveUserUseCase {
  final AuthRepository repository;

  SaveUserUseCase({required this.repository});

  Future<Either<Failure, Unit>> call({required User user}) {
    return repository.saveUser(user: user);
  }
}
