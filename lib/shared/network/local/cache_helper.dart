import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  //static SharedPreferences sharedPreferences;

  static init() async
  {
    //sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setData({
    @required String key,
    @required value,
  })
  {
    // if (value is String)
    //   return sharedPreferences.setString(key, value);
    // else if (value is bool)
    //   return sharedPreferences.setBool(key, value);
    // else if (value is int) return sharedPreferences.setInt(key, value);
    // return sharedPreferences.setDouble(key, value);
  }

  static dynamic getData({
    @required String key,
  }) {
    // return sharedPreferences.get(key);
  }
}