import 'package:dio/dio.dart';
import 'package:photo_stock/api/config/dio_config.dart';
import 'package:photo_stock/api/data/dio/dio_interceptor.dart';

/// The [DioClient] class to work with Dio package.
class DioClient {
  final _dio = Dio();

  DioClient() {
    _dio
      ..options.baseUrl = NetworkConstants.baseUrl
      ..options.connectTimeout = NetworkConstants.connectionTimeout
      ..options.receiveTimeout = NetworkConstants.receiveTimeout
      ..options.responseType = ResponseType.json
      ..interceptors.add(DioInterceptor());
  }

  Dio get dio => _dio;

  /// Get:--------------------------------------------------
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// Post:-------------------------------------------------
  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
