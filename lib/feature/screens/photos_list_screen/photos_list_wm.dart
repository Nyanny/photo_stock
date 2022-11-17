import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:photo_stock/api/data/models/photo.dart';
import 'package:photo_stock/api/data/repository/photo_repository.dart';
import 'package:photo_stock/feature/screens/photos_list_screen/photos_list_model.dart';
import 'package:photo_stock/feature/screens/photos_list_screen/photos_list_screen.dart';

/// WidgetModel for [PhotosListScreen] and [PhotosListModel]
/// Provides [maxHeight] and [minHeight]
/// Has a [refresh] method to refresh photos list
/// Has a [_loadPhotos] that fetches data from the model
class PhotosListWM extends WidgetModel<PhotosListScreen, PhotosListModel>
    implements IPhotosListWm {
  PhotosListWM(PhotosListModel model) : super(model);

  late final PagingController<int, Photo> _pagingController;

  int _pageNumber = 1;

  @override
  double get maxHeight => 132 + MediaQuery.of(context).padding.top;

  @override
  double get minHeight => kToolbarHeight + MediaQuery.of(context).padding.top;

  @override
  PagingController<int, Photo> get pagingController => _pagingController;

  @override
  void initWidgetModel() {
    _pagingController = PagingController<int, Photo>(firstPageKey: _pageNumber);
    pagingController.addPageRequestListener((pageKey) {
      _loadPhotos();
    });

    super.initWidgetModel();
  }

  @override
  Future<void> refresh() async {
    _pageNumber = 1;
    _pagingController.refresh();
  }

  Future<void> _loadPhotos() async {
    try {
      final photos = await model.getPhotos(_pageNumber);
      _pageNumber++;
      final isLastPage = photos.length < 10;
      if (!isLastPage) {
        _pagingController.appendPage(photos, _pageNumber);
      } else {
        _pagingController.appendLastPage(photos);
      }
    } catch (err) {
      _pagingController.error = err;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}

PhotosListWM createPhotosListScreenWM(BuildContext _) =>
    PhotosListWM(PhotosListModel(PhotoRepository()));

abstract class IPhotosListWm extends IWidgetModel {
  double get maxHeight;

  double get minHeight;

  PagingController<int, Photo> get pagingController;

  Future<void> refresh();
}
