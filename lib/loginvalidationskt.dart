import 'dart:async';

import 'package:flutter/services.dart';

class Loginvalidationskt {
  static const MethodChannel _channel =
      const MethodChannel('loginvalidationskt');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
  static Future<String> emailValidation(String email) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("email", () => email);
    final String validEmail = await _channel.invokeMethod('emailValidation', args);
    return validEmail;
  }
  static Future<String> passwordValidation(String password) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("password", () => password);
    final String validPassword = await _channel.invokeMethod('passwordValidation', args);
    return validPassword;
  }
  static Future<String> get platformVersiondata async {
    final String version = await _channel.invokeMethod('getPlatformVersiondata');
    return version;
  }
}
