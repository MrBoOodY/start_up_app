import 'package:alfaisal_for_advertising/common/core_data_source/failure.dart';
import 'package:alfaisal_for_advertising/features/authentication/data/models/user/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  /// Get My Profile Data from local data source
  Either<Failure, User?> getCurrentUser();

  /// Get User Profile Data from api
  Future<Either<Failure, User>> getUserProfile();

  Future<Either<Failure, String>> signUp({
    required String name,
    required String confirmPassword,
    required String phone,
    required String email,
    required String password,
    required int countryId,
  });
  Future<Either<Failure, Unit>> saveUser({required User user});

  Future<Either<Failure, String>> updateUserProfile({
    required String name,
    required String phone,
    required String email,
    String? image,
    String? password,
    required int countryId,
    required int? cityId,
    required int? areaId,
  });

  Future<Either<Failure, Unit>> signIn({
    required String email,
    required String password,
    required int countryId,
  });

  /// Log In With Social Media
  Future<Either<Failure, User>> loginWithSocial({
    required String name,
    required String phone,
    required String email,
    required String password,
    required int countryId,
  });
  Future<Either<Failure, Unit>> editProfileName({
    required String name,
  });
  Future<Either<Failure, String>> removeAccount({
    required String password,
  });
  Future<Either<Failure, String>> resetPassword({
    required int userId,
    required String password,
  });
  Future<Either<Failure, int>> forgetPassword({
    required String mobile,
  });
  Future<Either<Failure, Unit>> verifyCode(
      {required int userId, required String code});
  Future<Either<Failure, Unit>> logOut();
  Future<bool> get isLoggedIn;
}
