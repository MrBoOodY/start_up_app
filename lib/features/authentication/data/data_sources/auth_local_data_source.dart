import 'package:alfaisal_for_advertising/common/core_data_source/exception.dart';
import 'package:alfaisal_for_advertising/common/core_data_source/hive_helper/hive_helper.dart';
import 'package:alfaisal_for_advertising/common/core_data_source/hive_helper/hive_keys.dart';
import 'package:alfaisal_for_advertising/features/authentication/data/models/user/user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class AuthLocalDataSource {
  User getCurrentUser();
  Future<Unit> saveCurrentUser({
    required User userModel,
  });

  Future<bool> get isLoggedIn;
  Future<String> get getUserToken;
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final FlutterSecureStorage flutterSecureStorage;
  final HiveHelper hiveHelper;
  AuthLocalDataSourceImpl(
      {required this.flutterSecureStorage, required this.hiveHelper});

  @override
  User getCurrentUser() {
    final User? user = hiveHelper.getUser();
    if (user == null) {
      throw UnAuthorizedException();
    }

    return user;
  }

  @override
  Future<Unit> saveCurrentUser({required User userModel}) async {
    try {
      hiveHelper.saveUser(userModel);
      //TODO SAVE TOKEN
      /*    if (userModel.token != null) {
        flutterSecureStorage.write(
            key: StoredKeys.token, value: userModel.token);
      } */

      return unit;
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
    final token = await flutterSecureStorage.read(key: HiveKeys.token);
    if (token == null) {
      throw UnAuthorizedException();
    }
    return token;
  }
}
