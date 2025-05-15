import 'package:dio/dio.dart';

class ApiHelper {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> get({
    required String url,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    try {
      Response response = await _dio.get(
        url,
        queryParameters: queryParams,
        options: Options(headers: headers),
      );
      return response.data;
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
