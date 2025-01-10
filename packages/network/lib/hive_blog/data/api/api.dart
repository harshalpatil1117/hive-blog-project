import 'dart:convert';
import 'dart:io';
import 'package:network/core/network/constant/endpoints.dart';
import 'package:network/core/network/dio_client.dart';
import 'package:network/hive_blog/data/model/model.dart';

import '../../../core/network/constant/http_options.dart';

class HiveBlogApi {
  // dio instance
  final DioClient _dioClient;

  // injecting dio instance
  HiveBlogApi(this._dioClient);

  Future<Map<String, dynamic>> hiveBlogApiCall(
    HiveBlogRequest requestModel,
  ) async {
    try {
      final res = await _dioClient.post(
        Endpoints.baseUrl,
        data: jsonEncode(requestModel),
        options: HttpOptions.getOptions(
          {
            'OS': Platform.isAndroid ? 'Android' : 'IOS',
            'AppVersion': Platform.isAndroid ? Endpoints.appVersionAndroid : Endpoints.appVersionIOS,
          },
        ),
      );
      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}
