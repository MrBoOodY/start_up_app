import 'package:alfaisal_for_advertising/common/core_data_source/failure.dart';
import 'package:alfaisal_for_advertising/features/authentication/data/models/user/user.dart';
import 'package:alfaisal_for_advertising/injection/injection.dart';
import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'log_in_with_social_use_case.g.dart';

@riverpod
Future<Either<Failure, User>> logInWithSocialUseCase(
  LogInWithSocialUseCaseRef ref, {
  required String userName,
  required String phone,
  required String email,
  required String password,
  required int countryId,
}) {
  return ref.read(authRepositoryProvider).loginWithSocial(
      name: userName,
      phone: phone,
      email: email,
      password: password,
      countryId: countryId);
}
