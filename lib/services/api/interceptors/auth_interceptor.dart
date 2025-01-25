import 'package:dio/dio.dart';

import '../../../app_locator.dart';
import '../../auth_service.dart';
import '../api_service.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String? accessToken = locator<AuthService>().accessToken;

    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    super.onRequest(options, handler);
  }

  // TODO: update this function to handle concurrent requests of refresh
  @override
  void onError(DioException err, handler) async {
    try {
      if (err.response?.statusCode == 401) {
        // If a 401 response is received, refresh the access token
        if (locator<AuthService>().isRefreshing) {
          locator<AuthService>().isRefreshing = false;
          return handler.resolve(
            Response(
              requestOptions: err.requestOptions,
              statusCode: 200,
              data: {"message": "Resource not found, but it's okay!"}
            )
          );
        }
        locator<AuthService>().isRefreshing = true;

        // await locator<AuthService>().refreshAccessToken();
        String? accessToken = locator<AuthService>().accessToken;

        if (accessToken != null) {
          err.requestOptions.headers['Authorization'] = 'Bearer $accessToken';
        }

        // Repeat the request with the updated header
        return handler.resolve(
          await locator<ApiService>().request(
            err.requestOptions.path,
            options: Options(
              method: err.requestOptions.method,
              headers: err.requestOptions.headers,
              extra: err.requestOptions.extra,
              responseType: err.requestOptions.responseType,
              contentType: err.requestOptions.contentType,
            ),
            data: err.requestOptions.data,
            queryParams: err.requestOptions.queryParameters,
          ),
        );
      }
    } catch (e) {
      return handler.next(e as DioException);
    }
    return handler.next(err);
  }
}