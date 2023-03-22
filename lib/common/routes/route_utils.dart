import 'package:go_router/go_router.dart';
import 'package:alfaisal_for_advertising/common/routes/route_strings.dart';
import 'package:alfaisal_for_advertising/common/routes/routes/routes.dart';

class RouteUtils {
  static void goToSignInPage() {
    appContext.goNamed(RouteStrings.signIn);
  }

  static void goToBoarding() {
    appContext.pushNamed(RouteStrings.on_boarding);
  }

  static void goToHomePage() {
    appContext.goNamed(RouteStrings.home);
  }
}
