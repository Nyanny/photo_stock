import 'package:photo_stock/api/data/models/photo.dart';
import 'package:photo_stock/feature/domain/mappers/photo_mapper.dart';
import 'package:photo_stock/feature/domain/model/photo_dto.dart';

/// Mapper class for [List<PhotoDTO>] and [List<Photo>].
/// Gets [List<PhotoDTO>], returns after loop [List<Photo>].
class PhotosMapper {
  static List<Photo> photosDTOMapper(List<PhotoDTO> dto) {
    List<Photo> photos = [];
    for (int i = 0; i < dto.length; i++) {
      photos.add(PhotoMapper.photoDTOMapper(dto[i]));
    }
    return photos;
  }
}
