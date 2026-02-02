import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/core/networking/api_endpont.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static Dio? dio;
  static initDio() {
    dio ??= Dio(
      BaseOptions(
        baseUrl: ApiEndpont.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
    dio!.interceptors.add(PrettyDioLogger());
  }

  static getRequest(String endpoint, Map<String, dynamic> query) async {
    try {
      Response response = await dio!.get(endpoint, queryParameters: query);
      return response;
    } catch (e) {
      log(e.toString());
    }
  }
}
