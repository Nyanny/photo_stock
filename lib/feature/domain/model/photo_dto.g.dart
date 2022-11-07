// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoDTO _$PhotoDTOFromJson(Map<String, dynamic> json) => PhotoDTO(
      id: json['id'] as String,
      color: json['color'] as String,
      blurHash: json['blur_hash'] as String,
      likes: json['likes'] as int,
      urls: UrlsDTO.fromJson(json['urls'] as Map<String, dynamic>),
      user: UserDTO.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PhotoDTOToJson(PhotoDTO instance) => <String, dynamic>{
      'id': instance.id,
      'color': instance.color,
      'blur_hash': instance.blurHash,
      'likes': instance.likes,
      'urls': instance.urls,
      'user': instance.user,
    };

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => UserDTO(
      username: json['username'] as String,
    );

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) => <String, dynamic>{
      'username': instance.username,
    };

UrlsDTO _$UrlsDTOFromJson(Map<String, dynamic> json) => UrlsDTO(
      regular: json['regular'] as String,
    );

Map<String, dynamic> _$UrlsDTOToJson(UrlsDTO instance) => <String, dynamic>{
      'regular': instance.regular,
    };
