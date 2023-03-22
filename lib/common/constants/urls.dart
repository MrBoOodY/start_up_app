class Urls {
  static const String baseUrl = 'https://hunter.multi-kw.com/api';

  static String get onBoarding => '/screens';
  static String get countries => '/countries';
  static String get cities => '/cities';
  static String get areas => '/areas';
  static String get signInUser => '/login';
  static String get registerUser => '/register';
  static String get registerCompany => '/shop';
  static String get forgetPassword => '/check-email';
  static String get verifyCode => '/check-code';
  static String get resetPassword => '/forgot-password';
  static String get home => '/home';
  static String get homeAds => '/all-shop';
  static String get allShopAds => '/all-ads-shop';
  static String get adsDetails => '/adv';
  static String get getAdsByType => '/ads_by_type';
  static String get categories => '/categories';
  static String get subCategory => '/sub_category';
  static String get getCurrentCountry => '/?fields=country';
  static String get getMyFavList => '/my-like';
  static String get getMyActiveAds => '/my-ads';
  static String get getMyNotActiveAds => '/my-ads-notactive';
  static String get getMyArchivedAds => '/my-ads-archived';
  static String get editProfileName => '/edit-profile-name';
  static String get changeNotificationStatus => '/notifications/status';
  static String get saveNotificationsToken => '/notifications/save_token';
  static String get notifications => '/notifications';
  static String get getUserProfile => '/my-profile';
  static String get getCompanyProfile => '/my-shop';
  static String get updateUserProfile => '/edit-profile';
  static String get updateCompanyProfile => '/edit-my-shop';
  static String get removeAccount => '/remove-account';
  static String get aboutData => '/infos';
  static String get contactUsData => '/contacts';
  static String get postMessageDetails => '/contacts';
  static String get getPackages => '/packages-with';
  static String get getFeatures => '/features_advs';
  static String get toggleLike => '/toggle-like';
  static String get reportItem => '/report-adv';
  static String get getCategoryAds => '/adv_category';
  static String get getMyPackagesAds => '/get-my-packages-advs';
  static String get getCurrencies => '/currencies';
  static String get createAdForShop => '/create_advs_shop';
  static String get createAdForUser => '/create_advs_user';
  static String get storePackage => '/package-store';
  static String get activePaymentUserAd => '/active_payment_advs_user';
  static String get editAd => '/edit_advs';
  static String get adStatistics => '/my-view-adv';
  static String get makeCallAdv => '/call-adv';
  static String get makeWhatsappAdv => '/whatsapp-adv';
  static String get ads => '/ads';
  static String get deleteAd => '/delete-ad';
  static String get reportsOptions => '/reports-options';
  static String get socialLogin => '/login-with-social';
  static String get searchCategory => '/search-category';
  static String get searchInAds => '/search';
}

class ServerService<T> {
  ///timeout duration
  Future<T> timeOutMethod(Future<T> Function() function) async {
    return await Future.delayed(const Duration(seconds: 10), () async {
      return await function();
    });
  }
}
