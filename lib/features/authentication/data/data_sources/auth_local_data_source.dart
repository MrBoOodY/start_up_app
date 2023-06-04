import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:start_up_app/common/core_data_source/exception.dart';
import 'package:start_up_app/common/core_data_source/flutter_secure_storage_provider.dart';
import 'package:start_up_app/common/core_data_source/hive/hive_helper.dart';
import 'package:start_up_app/common/core_data_source/hive/hive_keys.dart';
import 'package:start_up_app/features/authentication/data/models/user/user.dart';

part 'auth_local_data_source.g.dart';

@riverpod
IAuthLocalDataSource authLocalDataSource(AuthLocalDataSourceRef ref) =>
    AuthLocalDataSource(
      flutterSecureStorage: ref.read(flutterSecureStorageProvider),
      hiveHelper: ref.read(hiveHelperProvider),
    );

abstract class IAuthLocalDataSource {
  User getCurrentUser();
  Future<void> saveCurrentUser({
    required User userModel,
  });

  Future<void> logOut();

  Future<bool> get isLoggedIn;
  Future<String> get getUserToken;
}

class AuthLocalDataSource implements IAuthLocalDataSource {
  final FlutterSecureStorage flutterSecureStorage;
  final HiveHelper hiveHelper;
  AuthLocalDataSource({
    required this.flutterSecureStorage,
    required this.hiveHelper,
  });

  @override
  User getCurrentUser() {
    final User? user = hiveHelper.getUser;
    if (user == null) {
      throw const UnAuthorizedException();
    }

    return user;
  }

  @override
  Future<void> saveCurrentUser({required User userModel}) async {
    try {
      if (userModel.accessToken != null) {
        flutterSecureStorage.write(
            key: HiveKeys.instance.token, value: userModel.accessToken!);
      }
      hiveHelper.saveUser(userModel);
    } catch (error) {
      throw const DatabaseException();
    }
  }

  @override
  Future<bool> get isLoggedIn async {
    try {
      await getUserToken;
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<String> get getUserToken async {
    final token = await flutterSecureStorage.read(key: HiveKeys.instance.token);
    if (token == null) {
      throw const UnAuthorizedException();
    }
    return token;
  }

  @override
  Future<void> logOut() async {
    hiveHelper.resetUser();
    flutterSecureStorage.delete(key: HiveKeys.instance.token);
  }
}
