

import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://mawasims.com.sa/api',
        receiveDataWhenStatusError: true,
        connectTimeout: 20 *1000,
        receiveTimeout: 20 * 1000,
      ),
    );
  }

  static Future<Response?> getData(
      {
        required String url,
        Map<String, dynamic>? query,
        String lang = 'en',
      }) async{
    dio?.options.headers =
    {
      'Accept-Language':'ar',
      'Accept':'application/json',
    };

    return await dio?.get(
      url,
      queryParameters: query,
    );
  }




  static Future<Response?> postData( {
    required String url,
    Map<String,dynamic>? query,
    required Map<String,dynamic> data,
    String? accessToken,
  }) async
  {
    dio?.options.headers =
    {
      'Accept-Language':'ar',
      'Accept':'application/json',
      'Authorization':'$accessToken',
    };
    return await dio?.post(
      url,
      queryParameters:query,
      data:data,
    );
  }

}