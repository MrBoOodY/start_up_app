import 'package:sentry_flutter/sentry_flutter.dart';

class SentryService {
  static init() async {
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'Sentry Key';

        options.tracesSampleRate = 1.0;
      },
    );
  }
}
