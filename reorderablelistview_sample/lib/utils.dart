import 'dart:io';

import 'package:flutter/foundation.dart';

class Utils{
  static String getPlatformName () {

    if (kIsWeb) {
      return 'Web';
    }

    if (Platform.isIOS) {
      return 'iOS';
    }
    else if (Platform.isAndroid) {
      return 'Android';
    }
    else if (Platform.isWindows) {
      return 'Windows';
    }
    else if (Platform.isLinux) {
      return 'Linux';
    }
    else if (Platform.isMacOS) {
      return 'Mac';
    }

    return '';
  }
}

