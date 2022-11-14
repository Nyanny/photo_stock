import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_stock/api/data/models/photo.dart';
import 'package:photo_stock/assets/app_sizes.dart';
import 'package:photo_stock/feature/bloc/photos_bloc.dart';
import 'package:photo_stock/widgets/photo_grid_item.dart';

/// Class [PhotosGrid] is a [SliverGrid] with [SliverPadding] build by [BlocBuilder]
/// Items in the table are [PhotoGridItem]
class PhotosGrid extends StatelessWidget {
  const PhotosGrid({Key? key}) : super(key: key);

  /// Depends on a caught state builds SliverGrid with [photos[index]] value or a snackBar with an Error
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotosBloc, PhotosState>(
      builder: (context, state) {
        List<Photo> photos = [];
        if (state is PhotosLoadingState && !state.isFirstFetch) {
          photos = state.oldPhotos;
        } else if (state is PhotosLoadedState) {
          photos = state.photos;
        } else if (state is PhotosErrorState) {
          final snackBar = SnackBar(
            content: Text(state.message),
          );

          /// Prevents grid items disappear
          Future.delayed(const Duration(milliseconds: 2), () {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          });
          List<Photo>? tempPhotos = state.photosBeforeError;
          if (tempPhotos != null) {
            photos = tempPhotos;
          }
        } else {
          return const SliverToBoxAdapter(
            child: SizedBox.shrink(),
          );
        }
        return SliverPadding(
          padding: const EdgeInsets.only(
              left: AppSizes.paddingHorizontal,
              right: AppSizes.paddingHorizontal,
              bottom: 0),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              childCount: photos.length,
              (context, index) {
                return PhotoGridItem(
                  photo: photos[index],
                );
              },
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: AppSizes.paddingGridItems,
              crossAxisSpacing: AppSizes.paddingGridItems,
            ),
          ),
        );
      },
    );
  }
}
