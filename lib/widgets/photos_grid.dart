import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:photo_stock/api/data/models/photo.dart';
import 'package:photo_stock/assets/app_sizes.dart';
import 'package:photo_stock/widgets/photo_grid_item.dart';

/// Class [PhotosGrid] is a with [SliverPadding], child: [PagedSliverGrid]  with builder [PagedChildBuilderDelegate]
/// Has a [pagingController] that rules the grid
class PhotosGrid extends StatelessWidget {
  final PagingController<int, Photo> pagingController;

  const PhotosGrid({required this.pagingController, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppSizes.paddingHorizontal),
      sliver: PagedSliverGrid<int, Photo>(
        pagingController: pagingController,
        showNewPageProgressIndicatorAsGridChild: false,
        showNewPageErrorIndicatorAsGridChild: false,
        showNoMoreItemsIndicatorAsGridChild: false,
        builderDelegate: PagedChildBuilderDelegate<Photo>(
            newPageProgressIndicatorBuilder: (_) => const _ProgressIndicator(),
            itemBuilder: (_, item, __) {
              return PhotoGridItem(photo: item);
            }),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: AppSizes.paddingGridItems,
          crossAxisSpacing: AppSizes.paddingGridItems,
        ),
      ),
    );
  }
}

class _ProgressIndicator extends StatelessWidget {
  const _ProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 25, top: 41),
      child: CupertinoActivityIndicator(),
    );
  }
}
