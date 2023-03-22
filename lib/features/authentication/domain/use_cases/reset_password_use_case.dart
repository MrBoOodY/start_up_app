import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alfaisal_for_advertising/common/core_data_source/failure.dart';
import 'package:alfaisal_for_advertising/features/authentication/domain/repositories/auth_repository.dart';
import 'package:alfaisal_for_advertising/injection/injection.dart';

final resetPasswordUserUseCase = Provider.autoDispose(
    (ref) => ResetPasswordUseCase(ref.read(authRepositoryProvider)));

class ResetPasswordUseCase {
  final AuthRepository repository;

  ResetPasswordUseCase(this.repository);

  Future<Either<Failure, String>> call({
    required int userId,
    required String password,
  }) {
    return repository.resetPassword(
      userId: userId,
      password: password,
    );
  }
}
