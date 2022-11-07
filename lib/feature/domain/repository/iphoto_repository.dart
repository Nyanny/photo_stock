import 'package:photo_stock/api/data/models/photo.dart';

/// Basic Photo repository.
abstract class IPhotoRepository {
  /// Requests [List<Photo>] from a source.
  Future<List<Photo>> getPhotos({int pageNumber = 1});
}
