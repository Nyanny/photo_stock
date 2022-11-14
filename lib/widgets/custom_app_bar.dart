import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:photo_stock/assets/app_sizes.dart';
import 'package:photo_stock/assets/app_styles.dart';
import 'package:photo_stock/assets/res_consts.dart';

/// Class [CustomAppBar] is the "Appbar" made by [SliverPersistentHeader]
class CustomAppBar extends StatelessWidget {
  final double maxHeight;
  final double minHeight;

  const CustomAppBar(
      {Key? key, required this.maxHeight, required this.minHeight})
      : super(key: key);

  /// Builds pinned [SliverAppBar] with flexibleSpace [_Header]
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      flexibleSpace: _Header(
        maxHeight: maxHeight,
        minHeight: minHeight,
      ),
      expandedHeight: maxHeight - MediaQuery.of(context).padding.top,
    );
  }
}

/// Private class [_Header]
/// Returns [LayoutBuilder]
class _Header extends StatelessWidget {
  final double maxHeight;
  final double minHeight;

  const _Header({Key? key, required this.maxHeight, required this.minHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final expandRatio = _calculateExpandRatio(constraints);
        final animation = AlwaysStoppedAnimation(expandRatio);

        /// Content of AppBar
        return Stack(
          fit: StackFit.expand,
          children: [
            ClipRect(
              /// AppBar's "background"
              /// Blurs when collapsed
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 150),
                  opacity: animation.value,
                  child: ColoredBox(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ),
            ),
            _TitleWidget(
              animation: animation,
            ),
          ],
        );
      },
    );
  }

  /// Calculates the expand/collapse ratio
  double _calculateExpandRatio(BoxConstraints constraints) {
    var expandRatio =
        (constraints.maxHeight - minHeight) / (maxHeight - minHeight);
    if (expandRatio > 1.0) expandRatio = 1.0;
    if (expandRatio < 0.0) expandRatio = 0.0;
    return expandRatio;
  }
}

/// Title of the AppBar
/// Text travels animated from left to centre (or vice versa) with changing it's style
class _TitleWidget extends StatelessWidget {
  final Animation<double> animation;

  const _TitleWidget({Key? key, required this.animation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontSize = Tween<double>(begin: 20, end: 24).evaluate(animation);
    final height =
        Tween<double>(begin: 33 / 24, end: 27 / 20).evaluate(animation);

    return Align(
      alignment: AlignmentTween(
              begin: Alignment.bottomCenter, end: Alignment.bottomLeft)
          .evaluate(animation),
      child: Container(
        margin: EdgeInsets.lerp(
          const EdgeInsets.only(bottom: 14),
          const EdgeInsets.only(left: AppSizes.paddingHorizontal, bottom: 24),
          animation.value,
        ),
        child: Text(
          AppStrings.photosAppBarTitle,
          style: AppTextStyles.manrope20h27w700Black.copyWith(
            fontSize: fontSize,
            height: height,
          ),
        ),
      ),
    );
  }
}
