import 'package:dio/dio.dart';
import 'package:photo_stock/api/data/dio/dio_client.dart';
import 'package:photo_stock/feature/domain/model/photo_dto.dart';
import 'package:photo_stock/feature/di/getit_di.dart';

import 'config/dio_config.dart';

/// An API class that works with DioClient using a [dioClient] instance.
/// The [getPhotosFromAPI] method requests data from API, maps and returns as [List<PhotoDTO>]. Also rethrows exceptions.
class PhotosApi {
  /// [DioClient] instance.
  final dioClient = getIt.get<DioClient>();

  /// Requests data from API, maps responded data to [List<PhotoDTO>].
  /// Rethrow exception.
  Future<List<PhotoDTO>> getPhotosFromAPI(int pageNumber) async {
    try {
      final Response response = await dioClient.get(
        NetworkConstants.photosListUrl,
        queryParameters: {'page': pageNumber},
      );

      final photos =
          (response.data as List).map((e) => PhotoDTO.fromJson(e)).toList();
      return photos;
    } catch (e) {
      rethrow;
    }
  }
}
