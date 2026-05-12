import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  static const String baseUrl = 'https://www.googleapis.com/books/v1/';

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    String url = endPoint.startsWith('http') ? endPoint : '$baseUrl$endPoint';
    var response = await _dio.get(url);
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    String url = endPoint.startsWith('http') ? endPoint : '$baseUrl$endPoint';
    _dio.options.headers = {
      if (token != null) 'Authorization': 'Bearer $token',
    };
    var response = await _dio.post(url, data: data);
    return response.data;
  }

}
