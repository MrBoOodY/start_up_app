class AppStrings {
  static AppStrings? _instance;
  AppStrings._();
  static AppStrings get instance {
    _instance ??= AppStrings._();
    return _instance!;
  }

  final String apiImagePath =
      'https://hunter.multi-kw.com/assets/front/images/';

  final String dateFormatYMD = 'y-MM-dd';

  final int unAuthorizedStatusCode = 401;
  final int successStatusCode = 200;
  final int successStatusCode2 = 201;

  final int unVerifiedStatusCode = 403;
}
