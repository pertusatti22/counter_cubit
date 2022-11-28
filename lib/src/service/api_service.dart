import 'dart:developer';

import 'package:counter_cubit/src/constants/api_constants.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response?> getPostData() async {
    try {
      final Response response = await _dio.get('$baseUrl/$posts');
      return response;
    } catch (err) {
      log("Error : $err");
    }
    return null;
  }

  Future<Response?> getTodoData() async {
    try {
      final Response response = await _dio.get('$baseUrl/$todos');
      return response;
    } catch (err) {
      log("Error: $err");
    }
    return null;
  }
}
