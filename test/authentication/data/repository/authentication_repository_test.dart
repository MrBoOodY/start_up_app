import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:start_up_app/common/core_data_source/exception.dart';
import 'package:start_up_app/common/core_data_source/failure.dart';
import 'package:start_up_app/common/core_data_source/flutter_secure_storage_provider.dart';
import 'package:start_up_app/common/core_data_source/helpers.dart';
import 'package:start_up_app/common/core_data_source/hive/hive_helper.dart';
import 'package:start_up_app/common/core_data_source/hive/hive_keys.dart';
import 'package:start_up_app/features/authentication/data/data_sources/auth_local_data_source.dart';
import 'package:start_up_app/features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:start_up_app/features/authentication/data/models/user/user.dart';
import 'package:start_up_app/features/authentication/domain/repositories/auth_repository.dart';

import 'authentication_repository_test.mocks.dart';

@GenerateMocks([
  IAuthRemoteDataSource,
  IAuthLocalDataSource,
  HiveHelper,
  FlutterSecureStorage
])
void main() {
  late final MockIAuthRemoteDataSource mockIAuthRemoteDataSource;
  late final ProviderContainer container;
  late final IAuthRepository authRepository =
      container.read(authRepositoryProvider);
  setUpAll(() async {
    mockIAuthRemoteDataSource = MockIAuthRemoteDataSource();
    final MockHiveHelper mockHiveHelper = MockHiveHelper();
    final MockFlutterSecureStorage mockFlutterSecureStorage =
        MockFlutterSecureStorage();
    container = ProviderContainer(
      overrides: [
        authRemoteDataSourceProvider
            .overrideWith((ref) => mockIAuthRemoteDataSource),
        hiveHelperProvider.overrideWith((ref) => mockHiveHelper),
        flutterSecureStorageProvider
            .overrideWith((ref) => mockFlutterSecureStorage),
      ],
    );
  });
  group('Auth repository Sign In tests', () {
    Future<User> whenMethod() async => await container
        .read(authRemoteDataSourceProvider)
        .signIn(password: '123123', email: 'a@a.com');
    Future<void> actualMethod() async => await authRepository.signIn(
        password: '123123', email: 'a@a.com', countryId: 1);
    const resultUser =
        User(accessToken: 'sadfsd', phone: '1231231231', name: 'userName');
    test('Sign in success with token', () async {
      when(whenMethod()).thenAnswer((_) async => resultUser);
      when(container.read(hiveHelperProvider).saveUser(resultUser)).thenAnswer(
        (realInvocation) => null,
      );
      when(container.read(flutterSecureStorageProvider).write(
              key: HiveKeys.instance.token, value: resultUser.accessToken))
          .thenAnswer(
        (_) async {},
      );
      final result = await actualMethod();

      verify(container
          .read(flutterSecureStorageProvider)
          .write(key: HiveKeys.instance.token, value: resultUser.accessToken));

      verify(container.read(hiveHelperProvider)..saveUser(resultUser));

      expect(() => result, isA<void>());
    });
    test('Sign in success without token', () async {
      const userWithoutToken = User(phone: '1231231231', name: 'asdf');
      when(whenMethod()).thenAnswer((_) async => userWithoutToken);
      when(container.read(hiveHelperProvider).saveUser(userWithoutToken))
          .thenAnswer(
        (realInvocation) => null,
      );
      when(container.read(flutterSecureStorageProvider).write(
              key: HiveKeys.instance.token,
              value: userWithoutToken.accessToken))
          .thenAnswer(
        (_) async {},
      );
      final result = await actualMethod();

      verifyNever(container.read(flutterSecureStorageProvider).write(
          key: HiveKeys.instance.token, value: userWithoutToken.accessToken));

      verify(container.read(hiveHelperProvider)..saveUser(userWithoutToken));

      expect(() => result, isA<void>());
    });
    test('Sign in Connection failure', () async {
      when(whenMethod()).thenThrow(const SocketException(''));

      expect(actualMethod, throwsA(isA<ConnectionFailure>()));
    });
    test('Sign in Un Authorized Failure', () async {
      when(whenMethod()).thenThrow(const UnAuthorizedException());

      expect(actualMethod, throwsA(isA<UnAuthorizedFailure>()));
    });
    test('Sign in Un Verified Failure', () async {
      when(whenMethod()).thenThrow(const UnVerifiedException());

      expect(actualMethod, throwsA(isA<UnVerifiedFailure>()));
    });
    test('Sign in Un Database Failure', () async {
      when(whenMethod()).thenThrow(const DatabaseException());

      expect(actualMethod, throwsA(isA<DatabaseFailure>()));
    });
    test('Sign in Un Exception Failure', () async {
      when(whenMethod()).thenThrow(Exception());

      expect(actualMethod, throwsA(isA<ExceptionFailure>()));
    });
    test('Sign in Server failure', () async {
      when(whenMethod()).thenThrow(const ServerException(message: ''));

      expect(actualMethod, throwsA(isA<ServerFailure>()));
    });
  });
  group('Auth repository Sign Up tests', () {
    Future<String> whenMethod() async =>
        await container.read(authRemoteDataSourceProvider).signUpUser(
              countryId: 1,
              email: 'a@a.com',
              password: '123123',
              confirmPassword: '123123',
              phone: '1231231231',
              name: 'userName',
            );
    Future<String> actualMethod() async => await authRepository.signUp(
          countryId: 1,
          email: 'a@a.com',
          password: '123123',
          confirmPassword: '123123',
          phone: '1231231231',
          name: 'userName',
        );
    test('Sign Up success', () async {
      when(whenMethod())
          .thenAnswer((_) async => 'user have been created successfully');

      final result = await actualMethod();

      expect(result, isA<String>());
    });

    test('Sign Up Connection failure', () async {
      when(whenMethod()).thenThrow(const SocketException(''));

      expect(actualMethod, throwsA(isA<ConnectionFailure>()));
    });
    test('Sign Up Un Authorized Failure', () async {
      when(whenMethod()).thenThrow(const UnAuthorizedException());

      expect(actualMethod, throwsA(isA<UnAuthorizedFailure>()));
    });
    test('Sign Up Un Verified Failure', () async {
      when(whenMethod()).thenThrow(const UnVerifiedException());

      expect(actualMethod, throwsA(isA<UnVerifiedFailure>()));
    });
    test('Sign Up Un Database Failure', () async {
      when(whenMethod()).thenThrow(const DatabaseException());

      expect(actualMethod, throwsA(isA<DatabaseFailure>()));
    });
    test('Sign Up Un Exception Failure', () async {
      when(whenMethod()).thenThrow(Exception());

      expect(actualMethod, throwsA(isA<ExceptionFailure>()));
    });
    test('Sign Up Server failure', () async {
      when(whenMethod()).thenThrow(const ServerException(message: ''));

      expect(actualMethod, throwsA(isA<ServerFailure>()));
    });
  });
  group('Auth repository Get Current User tests', () {
    User? whenMethod() => container.read(hiveHelperProvider).getUser;
    Future<User> actualMethod() async => authRepository.getCurrentUser();
    const resultUser = User(phone: '1231231231', name: 'userName');

    test('Get Current User success', () async {
      when(whenMethod()).thenAnswer((_) => resultUser);

      final result = await actualMethod();

      expect(result, resultUser);
    });

    test('Get Current User Un Authorized Failure', () async {
      when(whenMethod()).thenAnswer((_) => null);

      expect(actualMethod, throwsA(isA<UnAuthorizedFailure>()));
    });
  });
  group('Auth repository Is Logged In tests', () {
    Future<String?> whenMethod() async => await container
        .read(flutterSecureStorageProvider)
        .read(key: HiveKeys.instance.token);
    Future<bool?> actualIsLoggedIntMethod() async =>
        await authRepository.isLoggedIn;

    test('Is Logged In is true', () async {
      when(whenMethod()).thenAnswer((_) async => 'api token test');

      final result = await actualIsLoggedIntMethod();

      expect(result, true);
    });

    test('Is Logged In is false', () async {
      when(whenMethod()).thenAnswer((_) async => null);

      final result = await actualIsLoggedIntMethod();

      expect(result, false);
    });
  });
  group('Auth repository Log out Test tests', () {
    Future<void> whenMethod() async =>
        await container.read(authLocalDataSourceProvider).logOut();
    Future<void> actualMethod() async => await authRepository.logOut();

    test('Log out success', () async {
      when(whenMethod()).thenAnswer((_) async {});

      final result = await actualMethod();
      verify(container.read(hiveHelperProvider).resetUser()).called(1);
      verify(container
              .read(flutterSecureStorageProvider)
              .delete(key: HiveKeys.instance.token))
          .called(1);
      expect(() => result, isA<void>());
    });
  });

  group('Auth repository Reset Password tests', () {
    Future<String> whenMethod() async => await container
        .read(authRemoteDataSourceProvider)
        .resetPassword(password: '123123', userId: 1);
    Future<String> actualMethod() async =>
        await authRepository.resetPassword(password: '123123', userId: 1);
    test('Reset Password success', () async {
      when(whenMethod()).thenAnswer((_) async => 'reset password success');

      final result = await actualMethod();

      expect(result, isA<String>());
    });

    test('Reset Password Connection failure', () async {
      when(whenMethod()).thenThrow(const SocketException(''));

      expect(actualMethod, throwsA(isA<ConnectionFailure>()));
    });
    test('Reset Password Un Authorized Failure', () async {
      when(whenMethod()).thenThrow(const UnAuthorizedException());

      expect(actualMethod, throwsA(isA<UnAuthorizedFailure>()));
    });
    test('Reset Password Un Verified Failure', () async {
      when(whenMethod()).thenThrow(const UnVerifiedException());

      expect(actualMethod, throwsA(isA<UnVerifiedFailure>()));
    });
    test('Reset Password Un Database Failure', () async {
      when(whenMethod()).thenThrow(const DatabaseException());

      expect(actualMethod, throwsA(isA<DatabaseFailure>()));
    });
    test('Reset Password Un Exception Failure', () async {
      when(whenMethod()).thenThrow(Exception());

      expect(actualMethod, throwsA(isA<ExceptionFailure>()));
    });
    test('Reset Password Server failure', () async {
      when(whenMethod()).thenThrow(const ServerException(message: ''));

      expect(actualMethod, throwsA(isA<ServerFailure>()));
    });
  });

  group('Auth repository Remove Account tests', () {
    Future<String> whenMethod() async => await container
        .read(authRemoteDataSourceProvider)
        .removeAccount(password: '123123');
    Future<String> actualMethod() async =>
        await authRepository.removeAccount(password: '123123');
    test('Remove Account success', () async {
      when(whenMethod()).thenAnswer((_) async => 'reset password success');

      final result = await actualMethod();

      expect(result, isA<String>());
    });

    test('Remove Account Connection failure', () async {
      when(whenMethod()).thenThrow(const SocketException(''));

      expect(actualMethod, throwsA(isA<ConnectionFailure>()));
    });
    test('Remove Account Un Authorized Failure', () async {
      when(whenMethod()).thenThrow(const UnAuthorizedException());

      expect(actualMethod, throwsA(isA<UnAuthorizedFailure>()));
    });
    test('Remove Account Un Verified Failure', () async {
      when(whenMethod()).thenThrow(const UnVerifiedException());

      expect(actualMethod, throwsA(isA<UnVerifiedFailure>()));
    });
    test('Remove Account Un Database Failure', () async {
      when(whenMethod()).thenThrow(const DatabaseException());

      expect(actualMethod, throwsA(isA<DatabaseFailure>()));
    });
    test('Remove Account Un Exception Failure', () async {
      when(whenMethod()).thenThrow(Exception());

      expect(actualMethod, throwsA(isA<ExceptionFailure>()));
    });
    test('Remove Account Server failure', () async {
      when(whenMethod()).thenThrow(const ServerException(message: ''));

      expect(actualMethod, throwsA(isA<ServerFailure>()));
    });
  });
  group('Auth repository Get User From Network tests', () {
    Future<User> whenMethod() async =>
        await container.read(authRemoteDataSourceProvider).getUserProfile();
    Future<User> actualMethod() async => await authRepository.getUserProfile();
    const User whenResult =
        User(name: 'name', email: 'a@a.com', phone: '1231231231');
    test('Get User From Network success', () async {
      when(whenMethod()).thenAnswer((_) async => whenResult);

      final result = await actualMethod();

      expect(result, whenResult);
    });

    test('Get User From Network Connection failure', () async {
      when(whenMethod()).thenThrow(const SocketException(''));

      expect(actualMethod, throwsA(isA<ConnectionFailure>()));
    });
    test('Get User From Network Un Authorized Failure', () async {
      when(whenMethod()).thenThrow(const UnAuthorizedException());

      expect(actualMethod, throwsA(isA<UnAuthorizedFailure>()));
    });
    test('Get User From Network Un Verified Failure', () async {
      when(whenMethod()).thenThrow(const UnVerifiedException());

      expect(actualMethod, throwsA(isA<UnVerifiedFailure>()));
    });
    test('Get User From Network Un Database Failure', () async {
      when(whenMethod()).thenThrow(const DatabaseException());

      expect(actualMethod, throwsA(isA<DatabaseFailure>()));
    });
    test('Get User From Network Un Exception Failure', () async {
      when(whenMethod()).thenThrow(Exception());

      expect(actualMethod, throwsA(isA<ExceptionFailure>()));
    });
    test('Get User From Network Server failure', () async {
      when(whenMethod()).thenThrow(const ServerException(message: ''));

      expect(actualMethod, throwsA(isA<ServerFailure>()));
    });
  });
  group('Auth repository Update User Profile tests', () {
    Future<SuccessResult<User>> whenMethod() async =>
        await container.read(authRemoteDataSourceProvider).updateUserProfile(
              name: 'name',
              phone: 'phone',
              email: 'email',
              image: 'image',
              password: 'password',
              countryId: 1,
              cityId: 1,
              areaId: 1,
            );
    Future<void> actualMethod() async => await authRepository.updateUserProfile(
          name: 'name',
          phone: 'phone',
          email: 'email',
          image: 'image',
          password: 'password',
          countryId: 1,
          cityId: 1,
          areaId: 1,
        );
    const resultSuccess = SuccessResult(
        result:
            User(accessToken: 'sadfsd', phone: '1231231231', name: 'userName'),
        message: 'updated successfully');
    test('Update User Profile success with token', () async {
      when(whenMethod()).thenAnswer((_) async => resultSuccess);
      when(container.read(hiveHelperProvider).saveUser(resultSuccess.result))
          .thenAnswer(
        (realInvocation) => null,
      );
      when(container.read(flutterSecureStorageProvider).write(
              key: HiveKeys.instance.token,
              value: resultSuccess.result.accessToken))
          .thenAnswer(
        (_) async {},
      );
      final result = await actualMethod();

      verify(container.read(flutterSecureStorageProvider).write(
          key: HiveKeys.instance.token,
          value: resultSuccess.result.accessToken));

      verify(container.read(hiveHelperProvider).saveUser(resultSuccess.result));

      expect(() => result, isA<void>());
    });
    test('Update User Profile success without token', () async {
      const userWithoutToken = SuccessResult(
          message: 'success', result: User(phone: '1231231231', name: 'asdf'));
      when(whenMethod()).thenAnswer((_) async => userWithoutToken);
      when(container.read(hiveHelperProvider).saveUser(userWithoutToken.result))
          .thenAnswer(
        (realInvocation) => null,
      );
      when(container.read(flutterSecureStorageProvider).write(
              key: HiveKeys.instance.token,
              value: userWithoutToken.result.accessToken))
          .thenAnswer(
        (_) async {},
      );
      final result = await actualMethod();

      verifyNever(container.read(flutterSecureStorageProvider).write(
          key: HiveKeys.instance.token,
          value: userWithoutToken.result.accessToken));

      verify(container.read(hiveHelperProvider)
        ..saveUser(userWithoutToken.result));

      expect(() => result, isA<void>());
    });
    test('Update User Profile Connection failure', () async {
      when(whenMethod()).thenThrow(const SocketException(''));

      expect(actualMethod, throwsA(isA<ConnectionFailure>()));
    });
    test('Update User Profile Un Authorized Failure', () async {
      when(whenMethod()).thenThrow(const UnAuthorizedException());

      expect(actualMethod, throwsA(isA<UnAuthorizedFailure>()));
    });
    test('Update User Profile Un Verified Failure', () async {
      when(whenMethod()).thenThrow(const UnVerifiedException());

      expect(actualMethod, throwsA(isA<UnVerifiedFailure>()));
    });
    test('Update User Profile Un Database Failure', () async {
      when(whenMethod()).thenThrow(const DatabaseException());

      expect(actualMethod, throwsA(isA<DatabaseFailure>()));
    });
    test('Update User Profile Un Exception Failure', () async {
      when(whenMethod()).thenThrow(Exception());

      expect(actualMethod, throwsA(isA<ExceptionFailure>()));
    });
    test('Update User Profile Server failure', () async {
      when(whenMethod()).thenThrow(const ServerException(message: ''));

      expect(actualMethod, throwsA(isA<ServerFailure>()));
    });
  });

  group('Auth repository Forget Password tests', () {
    Future<int> whenMethod() async => await container
        .read(authRemoteDataSourceProvider)
        .forgetPassword(mobile: '1231231231');
    Future<int> actualMethod() async =>
        await authRepository.forgetPassword(mobile: '1231231231');

    test('Forget Password success', () async {
      when(whenMethod()).thenAnswer((_) async => 1234);

      final result = await actualMethod();

      expect(result, isA<int>());
    });

    test('Forget Password Connection failure', () async {
      when(whenMethod()).thenThrow(const SocketException(''));

      expect(actualMethod, throwsA(isA<ConnectionFailure>()));
    });
    test('Forget Password Un Authorized Failure', () async {
      when(whenMethod()).thenThrow(const UnAuthorizedException());

      expect(actualMethod, throwsA(isA<UnAuthorizedFailure>()));
    });
    test('Forget Password Un Verified Failure', () async {
      when(whenMethod()).thenThrow(const UnVerifiedException());

      expect(actualMethod, throwsA(isA<UnVerifiedFailure>()));
    });
    test('Forget Password Un Database Failure', () async {
      when(whenMethod()).thenThrow(const DatabaseException());

      expect(actualMethod, throwsA(isA<DatabaseFailure>()));
    });
    test('Forget Password Un Exception Failure', () async {
      when(whenMethod()).thenThrow(Exception());

      expect(actualMethod, throwsA(isA<ExceptionFailure>()));
    });
    test('Forget Password Server failure', () async {
      when(whenMethod()).thenThrow(const ServerException(message: ''));

      expect(actualMethod, throwsA(isA<ServerFailure>()));
    });
  });

  group('Auth repository Verify Code tests', () {
    Future<void> whenMethod() async => await container
        .read(authRemoteDataSourceProvider)
        .verifyCode(code: '1234', userId: 1);
    Future<void> actualMethod() async =>
        await authRepository.verifyCode(code: '1234', userId: 1);

    test('Verify Code success', () async {
      when(whenMethod()).thenAnswer((_) async {});

      final result = await actualMethod();

      expect(() => result, isA<void>());
    });

    test('Verify Code Connection failure', () async {
      when(whenMethod()).thenThrow(const SocketException(''));

      expect(actualMethod, throwsA(isA<ConnectionFailure>()));
    });
    test('Verify Code Un Authorized Failure', () async {
      when(whenMethod()).thenThrow(const UnAuthorizedException());

      expect(actualMethod, throwsA(isA<UnAuthorizedFailure>()));
    });
    test('Verify Code Un Verified Failure', () async {
      when(whenMethod()).thenThrow(const UnVerifiedException());

      expect(actualMethod, throwsA(isA<UnVerifiedFailure>()));
    });
    test('Verify Code Un Database Failure', () async {
      when(whenMethod()).thenThrow(const DatabaseException());

      expect(actualMethod, throwsA(isA<DatabaseFailure>()));
    });
    test('Verify Code Un Exception Failure', () async {
      when(whenMethod()).thenThrow(Exception());

      expect(actualMethod, throwsA(isA<ExceptionFailure>()));
    });
    test('Verify Code Server failure', () async {
      when(whenMethod()).thenThrow(const ServerException(message: ''));

      expect(actualMethod, throwsA(isA<ServerFailure>()));
    });
  });
}
