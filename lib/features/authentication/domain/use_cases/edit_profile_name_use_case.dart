import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alfaisal_for_advertising/common/core_data_source/failure.dart';
import 'package:alfaisal_for_advertising/features/authentication/domain/repositories/auth_repository.dart';
import 'package:alfaisal_for_advertising/injection/injection.dart';

final editProfileNameUseCase =
    Provider.autoDispose<EditProfileNameUseCase>((ref) {
  return EditProfileNameUseCase(repository: ref.read(authRepositoryProvider));
});

class EditProfileNameUseCase {
  final AuthRepository repository;

  EditProfileNameUseCase({required this.repository});

  Future<Either<Failure, Unit>> call({required String name}) {
    return repository.editProfileName(name: name);
  }
}
