import 'package:dio/dio.dart';

import '../api/api.dart';
import '../model/request.dart';
import '../model/response.dart';


class HiveBlogRepository {
  final HiveBlogApi _api;

  HiveBlogRepository(this._api);

  Future<HiveBlogResponse> hiveBlogRepo(
    HiveBlogRequest requestModel,
  ) async {
    try {
      final res = await _api.hiveBlogApiCall(
        requestModel,
      );
      final responseModel = HiveBlogResponse.fromJson(
        res,
      );
      return responseModel;
    } on DioError catch (e) {
      print("repo check ");
      print(e);
      if (e.response!.statusCode == 401) {
      } else {}
      return HiveBlogResponse();
    }
  }
}
