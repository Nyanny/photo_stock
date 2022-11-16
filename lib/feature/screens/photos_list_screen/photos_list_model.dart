import 'package:elementary/elementary.dart';
import 'package:photo_stock/api/data/models/photo.dart';
import 'package:photo_stock/api/data/repository/photo_repository.dart';

/// Model class
/// Provides [maxHeight] and [minHeight]
/// Has a [getPhotos] method that fetches data from the repository
class PhotosListModel extends ElementaryModel {
  final PhotoRepository _photoRepository;

  PhotosListModel(this._photoRepository);

  Future<List<Photo>> getPhotos(int photosPage) async {
    try {
      List<Photo> photosList =
          await _photoRepository.getPhotos(pageNumber: photosPage);
      return photosList;
    } catch (e) {
      rethrow;
    }
  }
}
