import 'package:start_up_app/common/core_data_source/helpers.dart';
import 'package:start_up_app/features/authentication/data/data_sources/auth_local_data_source.dart';
import 'package:start_up_app/features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:start_up_app/features/authentication/data/models/user/user.dart';
import 'package:start_up_app/features/authentication/domain/repositories/auth_repository.dart';

class AuthRepository implements IAuthRepository {
  final IAuthRemoteDataSource remoteDataSource;
  final IAuthLocalDataSource localDataSource;

  AuthRepository(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  User getCurrentUser() {
    return FailureHelper.instance<User>(() {
      return localDataSource.getCurrentUser();
    });
  }

  @override
  Future<void> saveUser({required User user}) async {
    return FailureHelper.instance<void>(() async {
      return await localDataSource.saveCurrentUser(
        userModel: user,
      );
    });
  }

  @override
  Future<User> getUserProfile() async {
    return FailureHelper.instance<Future<User>>(() async {
      return await remoteDataSource.getUserProfile();
    });
  }

  @override
  Future<void> signIn({
    required String email,
    required String password,
    required int countryId,
  }) async {
    return FailureHelper.instance<Future<void>>(() async {
      final result = await remoteDataSource.signIn(
        email: email,
        password: password,
      );

      await localDataSource.saveCurrentUser(userModel: result);
    });
  }

  @override
  Future<String> signUp({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
    required int countryId,
  }) async {
    return FailureHelper.instance<Future<String>>(() async {
      final result = await remoteDataSource.signUpUser(
        name: name,
        email: email,
        countryId: countryId,
        phone: phone,
        password: password,
        confirmPassword: confirmPassword,
      );

      return result;
    });
  }

  @override
  Future<String> updateUserProfile({
    required String name,
    required String phone,
    required String email,
    String? image,
    String? password,
    required int countryId,
    required int? cityId,
    required int? areaId,
  }) async {
    return FailureHelper.instance<Future<String>>(() async {
      final result = await remoteDataSource.updateUserProfile(
        name: name,
        email: email,
        phone: phone,
        image: image,
        areaId: areaId,
        cityId: cityId,
        countryId: countryId,
        password: password,
      );

      await localDataSource.saveCurrentUser(userModel: result.result);

      return result.message;
    });
  }

  @override
  Future<String> resetPassword({
    required int userId,
    required String password,
  }) async {
    return FailureHelper.instance<Future<String>>(() async {
      final result = await remoteDataSource.resetPassword(
        userId: userId,
        password: password,
      );

      return result;
    });
  }

  @override
  Future<void> logOut() async {
    return FailureHelper.instance<Future<void>>(() async {
      return localDataSource.logOut();
    });
  }

  @override
  Future<bool> get isLoggedIn => localDataSource.isLoggedIn;

  @override
  Future<int> forgetPassword({required String mobile}) async {
    return FailureHelper.instance<Future<int>>(() async {
      return await remoteDataSource.forgetPassword(mobile: mobile);
    });
  }

  @override
  Future<String> editProfileName({required String name}) async {
    return FailureHelper.instance<Future<String>>(() async {
      final result = await remoteDataSource.updateUserProfile(name: name);

      await localDataSource.saveCurrentUser(userModel: result.result);
      return result.message;
    });
  }

  @override
  Future<void> verifyCode({required int userId, required String code}) async {
    return FailureHelper.instance<Future<void>>(() async {
      await remoteDataSource.verifyCode(userId: userId, code: code);
    });
  }

  @override
  Future<String> removeAccount({required String password}) {
    return FailureHelper.instance<Future<String>>(() async {
      final result = await remoteDataSource.removeAccount(
        password: password,
      );
      return result;
    });
  }

  @override
  Future<User> loginWithSocial(
      {required String name,
      required String phone,
      required String email,
      required String password,
      required int countryId}) {
    return FailureHelper.instance<Future<User>>(() async {
      final result = await remoteDataSource.loginWithSocial(
          name: name,
          phone: phone,
          email: email,
          password: password,
          countryId: countryId);
      return result;
    });
  }
}
