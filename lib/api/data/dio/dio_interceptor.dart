import 'package:dio/dio.dart';
import 'package:photo_stock/api/config/dio_config.dart';

/// Interceptor class for [DioClient].
class DioInterceptor extends Interceptor {
  /// Adds a header in the [NetworkConstants.photosHeaderName]:[NetworkConstants.photosHeaderContent] format to the Api request.
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[NetworkConstants.photosHeaderName] =
        NetworkConstants.photosHeaderContent;
    super.onRequest(options, handler);
  }
}
