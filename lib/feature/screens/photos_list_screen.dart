import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_stock/assets/app_sizes.dart';
import 'package:photo_stock/feature/bloc/photos_bloc.dart';
import 'package:photo_stock/widgets/custom_app_bar.dart';
import 'package:photo_stock/widgets/photos_grid.dart';

/// Class [PhotosListScreen] is a screen with the a list(grid) of photos and their description.
/// Realised as [CustomScrollView] with 3 slivers: [CustomAppBar], [PhotosGrid] and [_LoadingIndicator]
class PhotosListScreen extends StatefulWidget {
  const PhotosListScreen({Key? key}) : super(key: key);

  @override
  State<PhotosListScreen> createState() => _PhotosListScreenState();
}

class _PhotosListScreenState extends State<PhotosListScreen> {
  /// Values needed in the [CustomAppBar]
  double get maxHeight => 132 + MediaQuery.of(context).padding.top;

  double get minHeight => kToolbarHeight + MediaQuery.of(context).padding.top;
  final _scrollController = ScrollController();

  /// listens [_scrollController] and calls the bloc to fetch new data when the scroll reaches the edge
  void setupScrollController(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          context.read<PhotosBloc>().add(PhotosFetchEvent());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          /// AppBar (LayoutBuilder())
          CustomAppBar(
            maxHeight: maxHeight,
            minHeight: minHeight,
          ),

          /// SliverGrid
          const PhotosGrid(),

          /// Loading indicator (BlocBuilder())
          const _LoadingIndicator()
        ],
      ),
    );
  }
}

/// Class [_LoadingIndicator] is a [CupertinoActivityIndicator] with the parameters required by the design
class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotosBloc, PhotosState>(builder: (context, state) {
      if (state is PhotosLoadingState) {
        return const SliverToBoxAdapter(
          child: SizedBox(
            height: 88,
            child: Center(
              child: SizedBox(
                height: AppSizes.cupertinoIndicatorSize,
                width: AppSizes.cupertinoIndicatorSize,
                child: CupertinoActivityIndicator(color: Colors.black),
              ),
            ),
          ),
        );
      }
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    });
  }
}
