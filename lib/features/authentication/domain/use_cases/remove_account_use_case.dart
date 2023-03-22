import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alfaisal_for_advertising/injection/injection.dart';

import '../../../../common/core_data_source/failure.dart';
import '../repositories/auth_repository.dart';

final removeAccountUseCase = Provider.autoDispose<RemoveAccountUseCase>((ref) {
  return RemoveAccountUseCase(repository: ref.read(authRepositoryProvider));
});

class RemoveAccountUseCase {
  final AuthRepository repository;

  RemoveAccountUseCase({required this.repository});

  Future<Either<Failure, String>> call({required password}) {
    return repository.removeAccount(
      password: password,
    );
  }
}
