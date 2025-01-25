import 'package:dio/dio.dart';

import '../../constants/api.dart';
import '../base.service.dart';
import 'interceptors/auth_interceptor.dart';

class ApiService extends BaseService {
  late Dio _dio;

  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl, // Replace with your base URL
        connectTimeout: const Duration(milliseconds: 50000),
        receiveTimeout: const Duration(milliseconds: 50000),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    _dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(milliseconds: 50000),
      receiveTimeout: const Duration(milliseconds: 50000),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      responseType: ResponseType.json,
    ));
    _dio.interceptors.add(AuthInterceptor());
  }

  // Handle errors
  void _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw Exception('Connection timeout');
      case DioExceptionType.badResponse:
        throw Exception('Received invalid status code: ${error.response?.statusCode}');
      case DioExceptionType.cancel:
        throw Exception('Request to API server was cancelled');
      case DioExceptionType.unknown:
        throw Exception('Connection to API server failed: ${error.message}');
      default:
        return;
    }
  }

  // GET request
  Future<Response> getRequest(String endpoint, {Map<String, dynamic>? data, Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _dio.get(
        endpoint,
        data: data,
        queryParameters: queryParams,
      );
      return response;
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  // POST request
  Future<Response> postRequest(String endpoint, {Map<String, dynamic>? data, Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _dio.post(endpoint, data: data, queryParameters: queryParams);
      return response;
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  // PUT request
  Future<Response> putRequest(String endpoint, {Map<String, dynamic>? data, Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _dio.put(endpoint, data: data, queryParameters: queryParams);
      return response;
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  // DELETE request
  Future<Response> deleteRequest(String endpoint, {Map<String, dynamic>? data, Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _dio.delete(endpoint, data: data, queryParameters: queryParams);
      return response;
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  // GET request
  Future<Response> request(String endpoint, {required Options options, Map<String, dynamic>? data, Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _dio.request(
        endpoint,
        options: options,
        data: data,
        queryParameters: queryParams,
      );
      return response;
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }
}