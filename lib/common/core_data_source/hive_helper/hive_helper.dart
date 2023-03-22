import 'package:alfaisal_for_advertising/common/core_data_source/hive_helper/hive_keys.dart';
import 'package:alfaisal_for_advertising/features/authentication/data/models/user/user.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hive_helper.g.dart';

@riverpod
class HiveHelper extends _$HiveHelper {
  HiveHelper._();
  factory HiveHelper() => HiveHelper._();
  Box<User>? _userBox;
  Box<String>? _userTokenBox;
  Box<bool>? _darkModeBox;
  Future<void> _init() async {
    await Hive.initFlutter();
    _userBox = await Hive.openBox(HiveKeys.currentUser);
    _userTokenBox = await Hive.openBox(HiveKeys.token);
    _darkModeBox = await Hive.openBox(HiveKeys.darkMode);
  }

  @override
  FutureOr<void> build() => _init();

  set saveUserToken(String userToken) {
    _userTokenBox?.put(HiveKeys.token, userToken);
  }

  String? get getUserToken {
    return _userTokenBox?.get(HiveKeys.token);
  }

  set saveUser(User user) {
    _userBox?.put(HiveKeys.currentUser, user);
  }

  User? get getUser {
    return _userBox?.get(HiveKeys.currentUser);
  }

  void resetUser() {
    _userBox?.delete(HiveKeys.currentUser);
    _userTokenBox?.delete(HiveKeys.token);
  }

  set setDarkMode(bool isDark) {
    _darkModeBox?.put(HiveKeys.darkMode, isDark);
  }

  bool get getDarkMode {
    return _darkModeBox?.get(HiveKeys.darkMode) ?? false;
  }
}
