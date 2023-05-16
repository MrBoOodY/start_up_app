class HiveKeys {
  static HiveKeys? _instance;
  HiveKeys._();
  static HiveKeys get instance {
    _instance ??= HiveKeys._();
    return _instance!;
  }

  final String token = 'token';
  final String currentUser = 'currentUser';
  final String darkMode = 'darkMode';
  final String country = 'country';
  final String language = 'language';
  final String onBoardingFinished = 'onBoardingFinished';
}
