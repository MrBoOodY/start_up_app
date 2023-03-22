import 'package:go_router/go_router.dart';
import 'package:alfaisal_for_advertising/common/routes/route_strings.dart';
import 'package:alfaisal_for_advertising/common/routes/routes/routes.dart';

class RouteUtils {
  static void goToSignInPage() {
    appContext.goNamed(RouteStrings.signIn);
  }

   
}
