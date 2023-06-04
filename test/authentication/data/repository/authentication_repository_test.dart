import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:simple_deal/common/core_data_source/exception.dart';
import 'package:simple_deal/common/core_data_source/failure.dart';
import 'package:simple_deal/common/core_data_source/flutter_secure_storage_provider.dart';
import 'package:simple_deal/common/core_data_source/hive/hive_helper.dart';
import 'package:simple_deal/common/core_data_source/hive/hive_keys.dart';
import 'package:simple_deal/features/authentication/data/data_sources/auth_local_data_source.dart';
import 'package:simple_deal/features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:simple_deal/features/authentication/data/models/user/user.dart';
import 'package:simple_deal/features/authentication/domain/repositories/auth_repository.dart';

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
    Future<User> whenSignInMethod() async => await container
        .read(authRemoteDataSourceProvider)
        .signIn(password: '123123', phoneNumber: '1231231231');
    Future<void> actualSignInMethod() async => await authRepository.signIn(
        password: '123123', phoneNumber: '1231231231');
    const resultUser =
        User(token: 'sadfsd', telPhone: '1231231231', userName: 'userName');
    test('Sign in success with token', () async {
      when(whenSignInMethod()).thenAnswer((_) async => resultUser);
      when(container.read(hiveHelperProvider).saveUser(resultUser)).thenAnswer(
        (realInvocation) => null,
      );
      when(container
              .read(flutterSecureStorageProvider)
              .write(key: HiveKeys.instance.token, value: resultUser.token))
          .thenAnswer(
        (_) async {},
      );
      final result = await actualSignInMethod();

      verify(container
          .read(flutterSecureStorageProvider)
          .write(key: HiveKeys.instance.token, value: resultUser.token));

      verify(container.read(hiveHelperProvider)..saveUser(resultUser));

      expect(() => result, isA<void>());
    });
    test('Sign in success without token', () async {
      const userWithoutToken =
          User(telPhone: '1231231231', userName: 'userName');
      when(whenSignInMethod()).thenAnswer((_) async => userWithoutToken);
      when(container.read(hiveHelperProvider).saveUser(userWithoutToken))
          .thenAnswer(
        (realInvocation) => null,
      );
      when(container.read(flutterSecureStorageProvider).write(
              key: HiveKeys.instance.token, value: userWithoutToken.token))
          .thenAnswer(
        (_) async {},
      );
      final result = await actualSignInMethod();

      verifyNever(container
          .read(flutterSecureStorageProvider)
          .write(key: HiveKeys.instance.token, value: userWithoutToken.token));

      verify(container.read(hiveHelperProvider)..saveUser(userWithoutToken));

      expect(() => result, isA<void>());
    });
    test('Sign in Connection failure', () async {
      when(whenSignInMethod()).thenThrow(const SocketException(''));

      expect(actualSignInMethod, throwsA(isA<ConnectionFailure>()));
    });
    test('Sign in Un Authorized Failure', () async {
      when(whenSignInMethod()).thenThrow(const UnAuthorizedException());

      expect(actualSignInMethod, throwsA(isA<UnAuthorizedFailure>()));
    });
    test('Sign in Un Verified Failure', () async {
      when(whenSignInMethod()).thenThrow(const UnVerifiedException());

      expect(actualSignInMethod, throwsA(isA<UnVerifiedFailure>()));
    });
    test('Sign in Un Database Failure', () async {
      when(whenSignInMethod()).thenThrow(const DatabaseException());

      expect(actualSignInMethod, throwsA(isA<DatabaseFailure>()));
    });
    test('Sign in Un Exception Failure', () async {
      when(whenSignInMethod()).thenThrow(Exception());

      expect(actualSignInMethod, throwsA(isA<ExceptionFailure>()));
    });
    test('Sign in Server failure', () async {
      when(whenSignInMethod()).thenThrow(const ServerException(message: ''));

      expect(actualSignInMethod, throwsA(isA<ServerFailure>()));
    });
  });
  group('Auth repository Sign Up tests', () {
    Future<String> whenSignUpMethod() async =>
        await container.read(authRemoteDataSourceProvider).signUpUser(
              addressId: '1',
              lat: 1,
              lng: 1,
              password: '123123',
              phoneNumber: '1231231231',
              secretCode: '1223',
              userName: 'userName',
            );
    Future<String> actualSignUpMethod() async =>
        await authRepository.signUpUser(
          addressId: '1',
          lat: 1,
          lng: 1,
          password: '123123',
          phoneNumber: '1231231231',
          secretCode: '1223',
          userName: 'userName',
        );
    test('Sign Up success', () async {
      when(whenSignUpMethod())
          .thenAnswer((_) async => 'user have been created successfully');

      final result = await actualSignUpMethod();

      expect(result, isA<String>());
    });

    test('Sign Up Connection failure', () async {
      when(whenSignUpMethod()).thenThrow(const SocketException(''));

      expect(actualSignUpMethod, throwsA(isA<ConnectionFailure>()));
    });
    test('Sign Up Un Authorized Failure', () async {
      when(whenSignUpMethod()).thenThrow(const UnAuthorizedException());

      expect(actualSignUpMethod, throwsA(isA<UnAuthorizedFailure>()));
    });
    test('Sign Up Un Verified Failure', () async {
      when(whenSignUpMethod()).thenThrow(const UnVerifiedException());

      expect(actualSignUpMethod, throwsA(isA<UnVerifiedFailure>()));
    });
    test('Sign Up Un Database Failure', () async {
      when(whenSignUpMethod()).thenThrow(const DatabaseException());

      expect(actualSignUpMethod, throwsA(isA<DatabaseFailure>()));
    });
    test('Sign Up Un Exception Failure', () async {
      when(whenSignUpMethod()).thenThrow(Exception());

      expect(actualSignUpMethod, throwsA(isA<ExceptionFailure>()));
    });
    test('Sign Up Server failure', () async {
      when(whenSignUpMethod()).thenThrow(const ServerException(message: ''));

      expect(actualSignUpMethod, throwsA(isA<ServerFailure>()));
    });
  });
  group('Auth repository Get Current User tests', () {
    User? whenGetUserMethod() => container.read(hiveHelperProvider).getUser;
    Future<User> actualGetUserMethod() async =>
        await authRepository.getCurrentUser();
    const resultUser = User(telPhone: '1231231231', userName: 'userName');

    test('Get Current User success', () async {
      when(whenGetUserMethod()).thenAnswer((_) => resultUser);

      final result = await actualGetUserMethod();

      expect(result, resultUser);
    });

    test('Get Current User Un Authorized Failure', () async {
      when(whenGetUserMethod()).thenAnswer((_) => null);

      expect(actualGetUserMethod, throwsA(isA<UnAuthorizedFailure>()));
    });
  });
  group('Auth repository Is Logged In tests', () {
    Future<String?> whenIsLoggedInMethod() async => await container
        .read(flutterSecureStorageProvider)
        .read(key: HiveKeys.instance.token);
    Future<bool?> actualIsLoggedIntMethod() async =>
        await authRepository.isLoggedIn;

    test('Is Logged In is true', () async {
      when(whenIsLoggedInMethod()).thenAnswer((_) async => 'api token test');

      final result = await actualIsLoggedIntMethod();

      expect(result, true);
    });

    test('Is Logged In is false', () async {
      when(whenIsLoggedInMethod()).thenAnswer((_) async => null);

      final result = await actualIsLoggedIntMethod();

      expect(result, false);
    });
  });
  group('Auth repository Log out Test tests', () {
    Future<void> whenLogOutMethod() async =>
        await container.read(authLocalDataSourceProvider).logOut();
    Future<void> actualLogOutMethod() async => await authRepository.logOut();

    test('Log out success', () async {
      when(whenLogOutMethod()).thenAnswer((_) async {});

      final result = await actualLogOutMethod();
      verify(container.read(hiveHelperProvider).resetUser()).called(1);
      verify(container
              .read(flutterSecureStorageProvider)
              .delete(key: HiveKeys.instance.token))
          .called(1);
      expect(() => result, isA<void>());
    });
  });

  group('Auth repository Reset Password tests', () {
    Future<String> whenResetPasswordMethod() async => await container
        .read(authRemoteDataSourceProvider)
        .resetPassword(password: '123123', userId: 1);
    Future<String> actualResetPasswordMethod() async =>
        await authRepository.resetPassword(password: '123123', userId: 1);
    test('Reset Password success', () async {
      when(whenResetPasswordMethod())
          .thenAnswer((_) async => 'reset password success');

      final result = await actualResetPasswordMethod();

      expect(result, isA<String>());
    });

    test('Reset Password Connection failure', () async {
      when(whenResetPasswordMethod()).thenThrow(const SocketException(''));

      expect(actualResetPasswordMethod, throwsA(isA<ConnectionFailure>()));
    });
    test('Reset Password Un Authorized Failure', () async {
      when(whenResetPasswordMethod()).thenThrow(const UnAuthorizedException());

      expect(actualResetPasswordMethod, throwsA(isA<UnAuthorizedFailure>()));
    });
    test('Reset Password Un Verified Failure', () async {
      when(whenResetPasswordMethod()).thenThrow(const UnVerifiedException());

      expect(actualResetPasswordMethod, throwsA(isA<UnVerifiedFailure>()));
    });
    test('Reset Password Un Database Failure', () async {
      when(whenResetPasswordMethod()).thenThrow(const DatabaseException());

      expect(actualResetPasswordMethod, throwsA(isA<DatabaseFailure>()));
    });
    test('Reset Password Un Exception Failure', () async {
      when(whenResetPasswordMethod()).thenThrow(Exception());

      expect(actualResetPasswordMethod, throwsA(isA<ExceptionFailure>()));
    });
    test('Reset Password Server failure', () async {
      when(whenResetPasswordMethod())
          .thenThrow(const ServerException(message: ''));

      expect(actualResetPasswordMethod, throwsA(isA<ServerFailure>()));
    });
  });

  group('Auth repository Remove Account tests', () {
    Future<String> whenRemoveAccountMethod() async => await container
        .read(authRemoteDataSourceProvider)
        .removeAccount(password: '123123');
    Future<String> actualRemoveAccountMethod() async =>
        await authRepository.removeAccount(password: '123123');
    test('Remove Account success', () async {
      when(whenRemoveAccountMethod())
          .thenAnswer((_) async => 'reset password success');

      final result = await actualRemoveAccountMethod();

      expect(result, isA<String>());
    });

    test('Remove Account Connection failure', () async {
      when(whenRemoveAccountMethod()).thenThrow(const SocketException(''));

      expect(actualRemoveAccountMethod, throwsA(isA<ConnectionFailure>()));
    });
    test('Remove Account Un Authorized Failure', () async {
      when(whenRemoveAccountMethod()).thenThrow(const UnAuthorizedException());

      expect(actualRemoveAccountMethod, throwsA(isA<UnAuthorizedFailure>()));
    });
    test('Remove Account Un Verified Failure', () async {
      when(whenRemoveAccountMethod()).thenThrow(const UnVerifiedException());

      expect(actualRemoveAccountMethod, throwsA(isA<UnVerifiedFailure>()));
    });
    test('Remove Account Un Database Failure', () async {
      when(whenRemoveAccountMethod()).thenThrow(const DatabaseException());

      expect(actualRemoveAccountMethod, throwsA(isA<DatabaseFailure>()));
    });
    test('Remove Account Un Exception Failure', () async {
      when(whenRemoveAccountMethod()).thenThrow(Exception());

      expect(actualRemoveAccountMethod, throwsA(isA<ExceptionFailure>()));
    });
    test('Remove Account Server failure', () async {
      when(whenRemoveAccountMethod())
          .thenThrow(const ServerException(message: ''));

      expect(actualRemoveAccountMethod, throwsA(isA<ServerFailure>()));
    });
  });
}
