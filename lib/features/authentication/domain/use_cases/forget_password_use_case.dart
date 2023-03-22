import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alfaisal_for_advertising/common/core_data_source/failure.dart';
import 'package:alfaisal_for_advertising/features/authentication/domain/repositories/auth_repository.dart';
import 'package:alfaisal_for_advertising/injection/injection.dart';

final forgetPasswordUseCase = Provider.autoDispose(
    (ref) => ForgetPasswordUseCase(ref.read(authRepositoryProvider)));

class ForgetPasswordUseCase {
  final AuthRepository repository;

  ForgetPasswordUseCase(this.repository);

  Future<Either<Failure, int>> call({
    required String mobile,
  }) {
    return repository.forgetPassword(mobile: mobile);
  }
}
