import 'package:photo_stock/api/config/api_key.dart';

/// Network constants for Dio.
class NetworkConstants {
  NetworkConstants._();

  // base url
  static const String baseUrl = 'https://api.unsplash.com';

  // url for photo's list
  static const String photosListUrl = '/photos';

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;

  // left part of a header
  static const String photosHeaderName = 'Authorization';

  // rigth parh of a header
  static const String photosHeaderContent = 'Client-ID $apiKey';
}
