import 'package:dio/dio.dart';
import 'package:photo_stock/api/data/dio/exeption_handling/dio_exception.dart';
import 'package:photo_stock/api/data/models/photo.dart';
import 'package:photo_stock/api/photos_api.dart';
import 'package:photo_stock/feature/domain/mappers/photos_mapper.dart';
import 'package:photo_stock/feature/domain/repository/iphoto_repository.dart';
import 'package:photo_stock/feature/di/getit_di.dart';

/// Implementation of [IPhotoRepository].
/// The [getPhotos] method returns [List<Photo>].
/// The [pageNumber] parameter specifies the requested page number.
class PhotoRepository implements IPhotoRepository {
  final photosApi = getIt.get<PhotosApi>();

  @override
  Future<List<Photo>> getPhotos({int pageNumber = 1}) async {
    try {
      final response = await photosApi.getPhotosFromAPI(pageNumber);
      final photos = PhotosMapper.photosDTOMapper(response);
      return photos;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
