import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo_dto.g.dart';

///  Data transfer objects based on API.
///  Contain [.fromJson] and [.ToJson] serialization and deserialization methods in each represented class.
///
///  Class [PhotoDTO] is DTO for Photo object.
@JsonSerializable()
@immutable
class PhotoDTO {
  /// Photo's id
  final String id;

  /// Photos' color
  final String color;

  /// Photos' blurHash
  @JsonKey(name: 'blur_hash')
  final String blurHash;

  /// Photos' likes
  final int likes;

  /// Photos' urls
  final UrlsDTO urls;

  /// Photos' user
  final UserDTO user;

  const PhotoDTO({
    required this.id,
    required this.color,
    required this.blurHash,
    required this.likes,
    required this.urls,
    required this.user,
  });

  factory PhotoDTO.fromJson(Map<String, dynamic> json) =>
      _$PhotoDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoDTOToJson(this);
}

// Class [UserDTO] is DTO for User object.
@JsonSerializable()
@immutable
class UserDTO {
  /// User' user
  final String username;

  const UserDTO({
    required this.username,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);
}

/// Class [UrlsDTO] is DTO for Urls object.
@JsonSerializable()
@immutable
class UrlsDTO {
  /// Urls' user
  /// This is the direct URL of the image.
  String regular;

  UrlsDTO({
    required this.regular,
  });

  factory UrlsDTO.fromJson(Map<String, dynamic> json) =>
      _$UrlsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UrlsDTOToJson(this);
}
