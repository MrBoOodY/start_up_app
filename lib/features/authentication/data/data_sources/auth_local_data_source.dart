import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:start_up_app/common/core_data_source/exception.dart';
import 'package:start_up_app/common/core_data_source/flutter_secure_storage_provider.dart';
import 'package:start_up_app/common/core_data_source/hive/hive_helper.dart';
import 'package:start_up_app/common/core_data_source/hive/hive_keys.dart';
import 'package:start_up_app/common/core_data_source/hive/hive_state.dart';
import 'package:start_up_app/features/authentication/data/models/user/user.dart';

part 'auth_local_data_source.g.dart';

@riverpod
IAuthLocalDataSource authLocalDataSource(AuthLocalDataSourceRef ref) =>
    AuthLocalDataSource(
      flutterSecureStorage: ref.read(flutterSecureStorageProvider),
      hiveHelper: ref.read(hiveHelperProvider.notifier),
      hiveValues: ref.read(hiveHelperProvider).requireValue,
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
  final HiveState hiveValues;
  AuthLocalDataSource(
      {required this.flutterSecureStorage,
      required this.hiveHelper,
      required this.hiveValues});

  @override
  User getCurrentUser() {
    final User? user = hiveValues.getUser;
    if (user == null) {
      throw UnAuthorizedException();
    }

    return user;
  }

  @override
  Future<void> saveCurrentUser({required User userModel}) async {
    try {
      if (userModel.accessToken != null) {
        hiveHelper.saveUserToken(userModel.accessToken!);
      }
      final userMap = userModel.toJson();
      userMap['accessToken'] = null;
      hiveHelper.saveUser(User.fromJson(userMap));
    } catch (error) {
      throw DatabaseException();
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
      throw UnAuthorizedException();
    }
    return token;
  }

  @override
  Future<void> logOut() async {
    hiveHelper.resetUser();
  }
}
