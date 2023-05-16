import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:start_up_app/common/core_data_source/hive/hive_keys.dart';
import 'package:start_up_app/features/authentication/data/models/user/user.dart';

part 'hive_state.freezed.dart';

@freezed
abstract class HiveState with _$HiveState {
  const HiveState._();
  String? get getUserToken {
    return userTokenBox?.get(HiveKeys.instance.token);
  }

  User? get getUser {
    return userBox?.get(HiveKeys.instance.currentUser);
  }

  bool get getDarkMode {
    return darkModeBox?.get(HiveKeys.instance.darkMode) ?? false;
  }

  const factory HiveState({
    final Box<String>? userTokenBox,
    final Box<User>? userBox,
    final Box<bool>? darkModeBox,
  }) = _HiveState;
}
