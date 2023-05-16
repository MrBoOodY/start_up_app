import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:start_up_app/features/authentication/data/data_sources/auth_local_data_source.dart';
import 'package:start_up_app/features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:start_up_app/features/authentication/data/models/user/user.dart';
import 'package:start_up_app/features/authentication/data/repositories/auth_repository.dart';

part 'auth_repository.g.dart';

@riverpod
IAuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(
    remoteDataSource: ref.read(authRemoteDataSourceProvider),
    localDataSource: ref.read(authLocalDataSourceProvider),
  );
}

abstract class IAuthRepository {
  /// Get My Profile Data from local data source
  User getCurrentUser();

  /// Get User Profile Data from api
  Future<User> getUserProfile();

  Future<String> signUp({
    required String name,
    required String confirmPassword,
    required String phone,
    required String email,
    required String password,
    required int countryId,
  });
  Future<void> saveUser({required User user});

  Future<String> updateUserProfile({
    required String name,
    required String phone,
    required String email,
    String? image,
    String? password,
    required int countryId,
    required int? cityId,
    required int? areaId,
  });

  Future<void> signIn({
    required String email,
    required String password,
    required int countryId,
  });

  /// Log In With Social Media
  Future<User> loginWithSocial({
    required String name,
    required String phone,
    required String email,
    required String password,
    required int countryId,
  });
  Future<String> editProfileName({
    required String name,
  });
  Future<String> removeAccount({
    required String password,
  });
  Future<String> resetPassword({
    required int userId,
    required String password,
  });
  Future<int> forgetPassword({
    required String mobile,
  });
  Future<void> verifyCode({required int userId, required String code});
  Future<void> logOut();
  Future<bool> get isLoggedIn;
}
