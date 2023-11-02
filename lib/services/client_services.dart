import 'package:dio/dio.dart';

class ClientServices {
  final Dio dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 15)));

  Future<dynamic> get(String requestUrl) async {
    try {
      final response = await dio.get(requestUrl);
      dynamic jsonResponse = response.data;
      return jsonResponse;
    } catch (e) {
      if (e is DioException) {
        if (e.response != null) {
          throw Exception('Response Error: ${e.response!.statusCode}');
        } else {
          throw Exception('Request Error: ${e.message}');
        }
      } else {
        throw Exception('Unexpected Error: $e');
      }
    }
  }

  Future<dynamic> post(String requestUrl, Map body) async {
    try {
      final response = await dio.post(requestUrl, data: body);
      dynamic jsonResponse = response.data;
      return jsonResponse;
    } catch (e) {
      if (e is DioException) {
        if (e.response != null) {
          throw Exception('Response Error: ${e.response!.statusCode}');
        } else {
          throw Exception('Request Error: ${e.message}');
        }
      } else {
        throw Exception('Unexpected Error: $e');
      }
    }
  }
}
