import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:start_up_app/features/authentication/data/models/user/user.dart';

import 'hive_keys.dart';

part 'hive_helper.g.dart';

@Riverpod(keepAlive: true)
HiveHelper hiveHelper(HiveHelperRef ref) {
  return HiveHelper();
}

class HiveHelper {
  late final Box<String> _userBox;
  late final Box<bool> _darkModeBox;
  late final Box<bool> _onBoardingBox;
  late final Box<String> _languageBox;

  Future<void> init() async {
    await Hive.initFlutter();
    await Future.wait(<Future<dynamic>>[
      Hive.openBox<String>(HiveKeys.instance.currentUser),
      Hive.openBox<bool>(HiveKeys.instance.darkMode),
      Hive.openBox<bool>(HiveKeys.instance.onBoardingFinished),
      Hive.openBox<String>(HiveKeys.instance.language),
    ]);
    _userBox = Hive.box(HiveKeys.instance.currentUser);
    _darkModeBox = Hive.box<bool>(HiveKeys.instance.darkMode);
    _onBoardingBox = Hive.box<bool>(HiveKeys.instance.onBoardingFinished);
    _languageBox = Hive.box<String>(HiveKeys.instance.language);
  }

/*
*
*
User Start Section 
*
*
*/

  User? get getUser {
    final userJson = _userBox.get(HiveKeys.instance.currentUser);
    if (userJson == null) return null;
    return User.fromJson(jsonDecode(userJson));
  }

  saveUser(User user) {
    _userBox.put(HiveKeys.instance.currentUser, jsonEncode(user.toJson()));
  }

  void resetUser() {
    _userBox.delete(HiveKeys.instance.currentUser);
  }

/*
*
*
User End Section 
*
*
*/

/*
*
*
Theme Mode Start Section 
*
*
*/
  bool get isDarkMode {
    return _darkModeBox.get(HiveKeys.instance.darkMode) ?? false;
  }

  setDarkMode(bool isDark) {
    _darkModeBox.put(HiveKeys.instance.darkMode, isDark);
  }

/*
*
*
Theme Mode End Section 
*
*
*/

/*
*
*
On Boarding Start Section 
*
*
*/
  bool get isOnBoardingFinished {
    return _onBoardingBox.get(HiveKeys.instance.onBoardingFinished) ?? false;
  }

  setOnBoardingFinished() {
    _onBoardingBox.put(HiveKeys.instance.onBoardingFinished, true);
  }

/*
*
*
On Boarding End Section 
*
*
*/

/*
*
*
Language Start Section 
*
*
*/
  String get getLanguage {
    return _languageBox.get(HiveKeys.instance.language) ?? 'ar';
  }

  set setLanguage(String lang) {
    _languageBox.put(HiveKeys.instance.language, lang);
  }

/*
*
*
Language End Section 
*
*
*/
}
