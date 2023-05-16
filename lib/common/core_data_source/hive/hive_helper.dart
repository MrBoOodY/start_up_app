import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:start_up_app/features/authentication/data/models/user/user.dart';

import 'hive_keys.dart';
import 'hive_state.dart';

part 'hive_helper.g.dart';

@riverpod
class HiveHelper extends _$HiveHelper {
  Future<HiveState> _init() async {
    await Hive.initFlutter();
    Future.wait(<Future<dynamic>>[
      Hive.openBox<User>(HiveKeys.instance.currentUser),
      Hive.openBox<String>(HiveKeys.instance.token),
      Hive.openBox<bool>(HiveKeys.instance.darkMode),
    ]);
    return HiveState(
      userBox: Hive.box(HiveKeys.instance.currentUser),
      userTokenBox: Hive.box<String>(HiveKeys.instance.token),
      darkModeBox: Hive.box<bool>(HiveKeys.instance.darkMode),
    );
  }

  @override
  FutureOr<HiveState> build() => _init();

  saveUserToken(String userToken) {
    state.value!.userTokenBox?.put(HiveKeys.instance.token, userToken);
  }

  saveUser(User user) {
    state.value!.userBox?.put(HiveKeys.instance.currentUser, user);
  }

  void resetUser() {
    state.value!.userBox?.delete(HiveKeys.instance.currentUser);
    state.value!.userTokenBox?.delete(HiveKeys.instance.token);
  }

  setDarkMode(bool isDark) {
    state.value!.darkModeBox?.put(HiveKeys.instance.darkMode, isDark);
  }
}
