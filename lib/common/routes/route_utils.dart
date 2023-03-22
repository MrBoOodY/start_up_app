import 'package:alfaisal_for_advertising/common/routes/route_strings.dart';
import 'package:alfaisal_for_advertising/common/routes/routes.dart';
import 'package:go_router/go_router.dart';

class RouteUtils {
  static void goToLoginPage() {
    Routes.context.goNamed(RouteStrings.login);
  }

  static void goToHomePage() {
    Routes.context.goNamed(RouteStrings.home);
  }
}
