import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:photo_stock/feature/screens/photos_list_screen/photos_list_wm.dart';
import 'package:photo_stock/widgets/custom_app_bar.dart';
import 'package:photo_stock/widgets/photos_grid.dart';

/// Class [PhotosListScreen] is a screen with the a list(grid) of photos and their description.
/// Connected with [PhotosListWM], that manages ui data
/// Realised as [CustomScrollView] with 2 slivers: [CustomAppBar], [PhotosGrid]
class PhotosListScreen extends ElementaryWidget<IPhotosListWm> {
  const PhotosListScreen({
    Key? key,
    WidgetModelFactory<PhotosListWM> wmFactory = createPhotosListScreenWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IPhotosListWm wm) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: wm.refresh,
        child: CustomScrollView(
          slivers: <Widget>[
            CustomAppBar(
              maxHeight: wm.maxHeight,
              minHeight: wm.minHeight,
            ),
            PhotosGrid(pagingController: wm.pagingController),
          ],
        ),
      ),
    );
  }
}
