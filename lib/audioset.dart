
import 'dart:async';

import 'package:flutter/services.dart';

class Audioset {
  static const MethodChannel _channel =
      const MethodChannel('audioset');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
