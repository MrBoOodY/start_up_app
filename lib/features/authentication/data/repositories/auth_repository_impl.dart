import 'package:alfaisal_for_advertising/common/core_data_source/failure.dart';
import 'package:alfaisal_for_advertising/common/core_data_source/helpers.dart';
import 'package:alfaisal_for_advertising/common/core_data_source/network_info.dart';
import 'package:alfaisal_for_advertising/features/authentication/data/data_sources/auth_local_data_source.dart';
import 'package:alfaisal_for_advertising/features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:alfaisal_for_advertising/features/authentication/data/models/user/user.dart';
import 'package:alfaisal_for_advertising/features/authentication/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  final NetworkInfo networkInfo;

  AuthRepositoryImpl(
      {required this.networkInfo,
      required this.remoteDataSource,
      required this.localDataSource});

  @override
  Either<Failure, User?> getCurrentUser() {
    return FailureHelper<User?>().notFutureCall(() {
      return localDataSource.getCurrentUser();
    });
  }

  @override
  Future<Either<Failure, Unit>> saveUser({required User user}) async {
    return FailureHelper<Unit>()(() async {
      await localDataSource.saveCurrentUser(
        userModel: user,
      );
      return unit;
    }, networkInfo);
  }

  @override
  Future<Either<Failure, User>> getUserProfile() async {
    return FailureHelper<User>()(() async {
      return await remoteDataSource.getUserProfile();
    }, networkInfo);
  }

  @override
  Future<Either<Failure, Unit>> signIn({
    required String email,
    required String password,
    required int countryId,
  }) async {
    return FailureHelper<Unit>()(() async {
      final result = await remoteDataSource.signIn(
        email: email,
        password: password,
      );

      await localDataSource.saveCurrentUser(userModel: result);

      /*  FirebaseMessaging.instance.getToken().then(
        (deviceToken) {
          if (deviceToken != null) {
            remoteDataSource.saveDeviceToken(
              deviceToken: deviceToken,
            );
          }
        },
      ); */

      return unit;
    }, networkInfo);
  }

  @override
  Future<Either<Failure, String>> signUp({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
    required int countryId,
  }) async {
    return FailureHelper<String>()(() async {
      final result = await remoteDataSource.signUpUser(
        name: name,
        email: email,
        countryId: countryId,
        phone: phone,
        password: password,
        confirmPassword: confirmPassword,
      );

      return result;
    }, networkInfo);
  }

  @override
  Future<Either<Failure, String>> updateUserProfile({
    required String name,
    required String phone,
    required String email,
    String? image,
    String? password,
    required int countryId,
    required int? cityId,
    required int? areaId,
  }) async {
    return FailureHelper<String>()(() async {
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
    }, networkInfo);
  }

  @override
  Future<Either<Failure, String>> resetPassword({
    required int userId,
    required String password,
  }) async {
    return FailureHelper<String>()(() async {
      final result = await remoteDataSource.resetPassword(
        userId: userId,
        password: password,
      );

      return result;
    }, networkInfo);
  }

  @override
  Future<Either<Failure, Unit>> logOut() async {
    return FailureHelper<Unit>()(() async {
      return unit;
    }, null);
  }

  @override
  Future<bool> get isLoggedIn => localDataSource.isLoggedIn;

  @override
  Future<Either<Failure, int>> forgetPassword({required String mobile}) async {
    return FailureHelper<int>()(() async {
      return await remoteDataSource.forgetPassword(mobile: mobile);
    }, networkInfo);
  }

  @override
  Future<Either<Failure, Unit>> editProfileName({required String name}) async {
    return FailureHelper<Unit>()(() async {
      final localResult = getCurrentUser();

      return localResult.fold((l) {
        throw l;
      }, (user) async {
        late final SuccessResult<User> result;

        result = await remoteDataSource.updateUserProfile(name: name);

        await localDataSource.saveCurrentUser(userModel: result.result);
        return unit;
      });
    }, networkInfo);
  }

  @override
  Future<Either<Failure, Unit>> verifyCode(
      {required int userId, required String code}) async {
    return FailureHelper<Unit>()(() async {
      await remoteDataSource.verifyCode(userId: userId, code: code);

      return unit;
    }, networkInfo);
  }

  @override
  Future<Either<Failure, String>> removeAccount({required String password}) {
    return FailureHelper<String>()(() async {
      final result = await remoteDataSource.removeAccount(
        password: password,
      );
      return result;
    }, networkInfo);
  }

  @override
  Future<Either<Failure, User>> loginWithSocial(
      {required String name,
      required String phone,
      required String email,
      required String password,
      required int countryId}) {
    return FailureHelper<User>()(() async {
      final result = await remoteDataSource.loginWithSocial(
          name: name,
          phone: phone,
          email: email,
          password: password,
          countryId: countryId);
      return result;
    }, networkInfo);
  }
}
