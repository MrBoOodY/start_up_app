class Urls {
  static Urls? _instance;

  Urls._();
  static Urls get instance {
    _instance ??= Urls._();
    return _instance!;
  }

  static const String baseUrl = 'API_LINK.com';

  static const String socialLogin = '/socialLogin';
  static const String removeAccount = '/removeAccount';
  static const String getUserProfile = '/getUserProfile';
  static const String resetPassword = '/resetPassword';
  static const String verifyCode = '/verifyCode';
  static const String forgetPassword = '/forgetPassword';
  static const String updateUserProfile = '/updateUserProfile';
  static const String registerUser = '/registerUser';
  static const String signInUser = '/signInUser';
}
