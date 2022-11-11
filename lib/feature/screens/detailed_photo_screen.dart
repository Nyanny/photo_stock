import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_stock/assets/app_styles.dart';
import 'package:photo_stock/widgets/back_button_widget.dart';
import 'package:photo_stock/widgets/details_text_widget.dart';

/// Class [DetailedPhotoScreen] is the screen with the selected photo and its description
class DetailedPhotoScreen extends StatelessWidget {
  // URL where the image should be displayed from
  final String url;

  // title in the description
  final String title;

  // subtitle in the description
  final String subtitle;

  /// Gets parameters through the [Navigator]
  const DetailedPhotoScreen({
    required this.url,
    required this.title,
    required this.subtitle,
    Key? key,
  }) : super(key: key);

  /// Builds the a screen with an picture, description below and [BackButtonWidget] on the picture in left top corner
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(32.0),
                  bottomLeft: Radius.circular(32.0),
                ),
                child: SizedBox(
                  width: 394,
                  height: 372,
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: url,
                  ),
                ),
              ),
              const Positioned(
                left: 18,
                top: 50,
                child: BackButtonWidget(),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 22),
            child: DetailsTextWidget(
              title: title,
              titleStyle: AppTextStyles.manrope32h44w700Black,
              subTitle: subtitle,
              subtitleStyle: AppTextStyles.manrope16h22w700Black,
            ),
          ),
        ],
      ),
    );
  }
}
