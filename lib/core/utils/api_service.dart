import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final baseUrl = "https://www.googleapis.com/books/v1/";
  final _apiKey = "key=AIzaSyB3HGbXRUEK1s2OyLHFhMVhNFXn2-b2wIo";

  ApiService(this._dio);
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$baseUrl$endPoint$_apiKey');
    return response.data;
  }
}
