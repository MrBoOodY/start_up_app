import 'package:alfaisal_for_advertising/common/core_data_source/failure.dart';
import 'package:alfaisal_for_advertising/features/authentication/domain/repositories/auth_repository.dart';
import 'package:alfaisal_for_advertising/injection/injection.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final verifyCodeUseCase = Provider.autoDispose(
    (ref) => VerifyCodeUseCase(ref.read(authRepositoryProvider)));

class VerifyCodeUseCase {
  final AuthRepository repository;

  VerifyCodeUseCase(this.repository);

  Future<Either<Failure, Unit>> call(
      {required int userId, required String code}) {
    return repository.verifyCode(userId: userId, code: code);
  }
}
