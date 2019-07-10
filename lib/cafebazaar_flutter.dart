import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';

class CafebazaarFlutter {
  static const MethodChannel _channel =
      const MethodChannel('cafebazaar_flutter');

  static Future<Null> showProgramPage(String packageName) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("packageName", () => packageName);
    await _channel.invokeMethod("referralToProgram", args);
    return null;
  }

  static Future<Null> setComment(String packageName) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("packageName", () => packageName);
    await _channel.invokeMethod("referralToComment", args);
    return null;
  }

  static Future<Null> showDeveloperPage(String developerId) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("developerId", () => developerId);
    await _channel.invokeMethod("referralToDeveloperPage", args);
    return null;
  }

  static Future<Null> showCafebazzarLogin() async {
    await _channel.invokeMethod("referralToLogin");
    return null;
  }

  static Future<Null> dispose() async {
    await _channel.invokeMethod("dispose");
    return null;
  }

  static Future<bool> initPay(
      {@required String rsaKey, bool debugMode = false}) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("rsaKey", () => rsaKey);
    args.putIfAbsent("debugMode", () => debugMode);
    bool result = await _channel.invokeMethod("initPay", args);
    return result;
  }

  static Future<dynamic> getPurchase({@required String sku}) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("sku", () => sku);
    dynamic result = await _channel.invokeMethod("getPurchase", args);
    return jsonDecode(result);
  }
  static Future<dynamic> queryInventoryAsync({@required String sku}) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("sku", () => sku);
    dynamic result = await _channel.invokeMethod("queryInventoryAsync", args);
    return null;
  }

  static Future<dynamic> launchPurchaseFlow(
      {@required String sku,
      bool consumption = false,
      String payload = ""}) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("productKey", () => sku);
    args.putIfAbsent("payload", () => payload);
    args.putIfAbsent("consumption", () => consumption);
    dynamic result = await _channel.invokeMethod("launchPurchaseFlow", args);
    return jsonDecode(result);
  }

  static Future<bool> verifyDeveloperPayload({@required String payload}) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("payload", () => payload);
    dynamic result =
        await _channel.invokeMethod("verifyDeveloperPayload", args);
    return result as bool;
  }
}
