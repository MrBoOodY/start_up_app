import 'package:hive_flutter/hive_flutter.dart';
import 'package:alfaisal_for_advertising/common/core_data_source/hive_helper/hive_keys.dart';
import 'package:alfaisal_for_advertising/features/authentication/data/models/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hive_helper.g.dart';

@riverpod
class HiveHelper extends _$HiveHelper {
  late final Box<User> _userBox;
  Future<void> _init() async {
    await Hive.initFlutter();
    _userBox = await Hive.openBox(HiveKeys.currentUser);
  }

  @override
  FutureOr<void> build() => _init();

  void saveUser(User user) {
    _userBox.put(HiveKeys.currentUser, user);
  }

  User? getUser() {
    return _userBox.get(HiveKeys.currentUser);
  }

  void resetUser() {
    _userBox.delete(HiveKeys.currentUser);
  }
}
