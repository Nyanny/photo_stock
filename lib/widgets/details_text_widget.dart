import 'package:flutter/material.dart';

/// Class [DetailsTextWidget] is
class DetailsTextWidget extends StatelessWidget {
  /// Title, placed at the top
  final String title;

  /// Subtitle, placed at the bottom
  final String subTitle;

  /// style of the [title]
  final TextStyle titleStyle;

  /// style of the [subTitle]
  final TextStyle subtitleStyle;

  const DetailsTextWidget({
    required this.title,
    required this.titleStyle,
    required this.subTitle,
    required this.subtitleStyle,
    Key? key,
  }) : super(key: key);

  /// build a [Column] with 2 [Text] inside
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle,
        ),
        Text(
          subTitle,
          style: subtitleStyle,
        ),
      ],
    );
  }
}
