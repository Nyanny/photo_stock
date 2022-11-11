import 'package:flutter/material.dart';
import 'package:photo_stock/widgets/custom_app_bar.dart';
import 'package:photo_stock/widgets/photos_grid.dart';

/// Class [PhotosListScreen] is a screen with the a list(grid) of photos and their description.
/// Realised as [CustomScrollView] with 2 slivers: [CustomAppBar] and [PhotosGrid]
class PhotosListScreen extends StatefulWidget {
  const PhotosListScreen({Key? key}) : super(key: key);

  @override
  State<PhotosListScreen> createState() => _PhotosListScreenState();
}

class _PhotosListScreenState extends State<PhotosListScreen> {
  /// Values needed in the [CustomAppBar]
  double get maxHeight => 132 + MediaQuery.of(context).padding.top;

  double get minHeight => kToolbarHeight + MediaQuery.of(context).padding.top;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          CustomAppBar(
            maxHeight: maxHeight,
            minHeight: minHeight,
          ),
          PhotosGrid(),
        ],
      ),
    );
  }
}
