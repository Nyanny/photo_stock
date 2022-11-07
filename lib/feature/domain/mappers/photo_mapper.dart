import 'package:photo_stock/api/data/models/photo.dart';
import 'package:photo_stock/feature/domain/model/photo_dto.dart';

/// Mapper class for [PhotoDTO] and [Photo].
/// Gets [PhotoDTO], returns [Photo].
class PhotoMapper {
  static Photo photoDTOMapper(PhotoDTO dto) {
    return Photo(
        id: dto.id,
        color: dto.color,
        blurHash: dto.blurHash,
        likes: dto.likes,
        urls: dto.urls.regular,
        user: dto.user.username);
  }
}
