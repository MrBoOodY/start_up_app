import 'package:sentry_flutter/sentry_flutter.dart';

class SentryService {
  static init() async {
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://d0a797d93c29447482e86ec94e94182a@o4504708613996544.ingest.sentry.io/4504708614979584';

        options.tracesSampleRate = 1.0;
      },
    );
  }
}
