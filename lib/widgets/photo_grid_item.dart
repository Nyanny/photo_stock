import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:photo_stock/api/data/models/photo.dart';
import 'package:photo_stock/assets/app_styles.dart';
import 'package:photo_stock/assets/extensions.dart';
import 'package:photo_stock/feature/screens/detailed_photo_screen.dart';

import 'details_text_widget.dart';

/// Class [PhotoGridItem] is a item in the Grid
/// Each item creates onTap a new screen [DetailedPhotoScreen] with the parameters passed in
class PhotoGridItem extends StatelessWidget {
  final Photo photo;

  const PhotoGridItem({Key? key, required this.photo}) : super(key: key);

  /// Builds a tappable card with a picture and text over this picture
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 8,
        shadowColor: HexColor.fromHex(photo.color),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Stack(
          children: [
            _CardPicture(
              hash: photo.blurHash,
              url: photo.urls,
            ),
            _CardText(
              title: photo.user,
              subTitle: '${photo.likes} likes',
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailedPhotoScreen(
              url: photo.urls,
              title: photo.user,
              subtitle: "${photo.likes} likes",
            ),
          ),
        );
      },
    );
  }
}

class _CardPicture extends StatelessWidget {
  final String hash;
  final String url;

  const _CardPicture({Key? key, required this.hash, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 158,
      width: 158,
      child: CachedNetworkImage(
        fit: BoxFit.fill,
        placeholder: (context, url) => BlurHash(
          hash: hash,
        ),
        imageUrl: url,
      ),
    );
  }
}

class _CardText extends StatelessWidget {
  final String title;
  final String subTitle;

  const _CardText({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 16,
      bottom: 10,
      child: DetailsTextWidget(
        title: title,
        titleStyle: AppTextStyles.manrope12h16w700White,
        subTitle: subTitle,
        subtitleStyle: AppTextStyles.manrope10h14w400White,
      ),
    );
  }
}
