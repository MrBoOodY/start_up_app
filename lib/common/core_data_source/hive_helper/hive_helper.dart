import 'package:alfaisal_for_advertising/common/core_data_source/hive_helper/hive_keys.dart';
import 'package:alfaisal_for_advertising/features/authentication/data/models/user/user.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hive_helper.g.dart';

@riverpod
class HiveHelper extends _$HiveHelper {
  late final Box<Map> userBox;
  Future<void> _init() async {
    await Hive.initFlutter();
    userBox = await Hive.openBox(HiveKeys.currentUser);
  }

  @override
  FutureOr<void> build() => _init();

  void saveUser(User user) {
    userBox.put(HiveKeys.currentUser, user.toJson());
  }

  User? getUser() {
    final userMapped = userBox.get(HiveKeys.currentUser);
    if (userMapped == null) {
      return null;
    }
    return User.fromJson(userMapped as Map<String, dynamic>);
  }

  void resetUser() {
    userBox.delete(HiveKeys.currentUser);
  }
}
