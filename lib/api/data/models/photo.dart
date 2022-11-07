/// Model class for data layer.
///
/// Model of Photo object.
class Photo {
  /// Photo's id
  final String id;

  /// Photos' color
  final String color;

  /// Photos' blurHash
  final String blurHash;

  /// Photos' likes
  final int likes;

  /// Photos' urls
  /// Unlike how represented in the [PhotoDTO] class,
  /// it is represented here as a string.
  final String urls;

  /// Photos' user
  /// Unlike how represented in the [PhotoDTO] class,
  /// it is represented here as a string.
  final String user;

  const Photo({
    required this.id,
    required this.color,
    required this.blurHash,
    required this.likes,
    required this.urls,
    required this.user,
  });
}
