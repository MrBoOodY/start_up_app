import 'dart:math';

import 'package:alfaisal_for_advertising/common/routes/routes.dart';
import 'package:flutter/widgets.dart';

extension ScreenSizeExtension on num {
  double get _femW {
    return MediaQuery.of(Routes.context).size.width / 375;
  }

  double get femW {
    return this * _femW;
  }

  double get r {
    return min(MediaQuery.of(Routes.context).size.height,
            MediaQuery.of(Routes.context).size.width) *
        this;
  }

  double get w {
    return MediaQuery.of(Routes.context).size.width * this;
  }

  double get h {
    return MediaQuery.of(Routes.context).size.height * this;
  }
}
