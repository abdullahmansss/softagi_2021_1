import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper
{
  static Dio dio;

  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    @required String url,
    Map<String, dynamic> query,
    String token,
  }) async
  {
    dio.options.headers =
    {
      'lang':'ar',
      'Content-Type':'application/json',
      if(token != null)
        'Authorization':token,
    };

    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    @required String url,
    Map<String, dynamic> data,
    String token,
  }) async
  {
    dio.options.headers =
    {
      'lang':'ar',
      'Content-Type':'application/json',
      if(token != null)
        'Authorization':token,
    };

    return await dio.post(
      url,
      data: data,
    );
  }
}