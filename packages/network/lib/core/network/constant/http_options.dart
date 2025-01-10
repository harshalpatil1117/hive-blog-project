import 'dart:io';

import 'package:dio/dio.dart';
import 'package:network/core/core.dart';

class HttpOptions {
  static Map<String, dynamic> getHeader(String xAuth) {
    return {
      'Accept': 'application/json, text/plain, /',
      'Content-Type': 'application/json',
      // 'OS': Platform.isAndroid ? 'Android' : 'IOS',
      // 'AppVersion': Platform.isAndroid ? Endpoints.appVersionAndroid : Endpoints.appVersionIOS,
    };
  }

  static Options getOptions(Map<String, dynamic>? header) {
    return Options(
      headers: header ?? {
        // 'OS': Platform.isAndroid ? 'Android' : 'IOS',
        // 'AppVersion': Platform.isAndroid ? Endpoints.appVersionAndroid : Endpoints.appVersionIOS,
      },
      contentType: "application/json",
    );
  }

  static Options getMultipartOptions(
      Map<String, dynamic>? header, var formData) {
    return Options(
      headers: header ?? {},
      contentType: 'multipart/form-data; boundary=${formData.boundary}',
    );
  }
}
