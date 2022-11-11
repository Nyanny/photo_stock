import 'package:flutter/material.dart';
import 'package:photo_stock/api/data/models/photo.dart';
import 'package:photo_stock/api/data/repository/photo_repository.dart';
import 'package:photo_stock/assets/app_sizes.dart';
import 'package:photo_stock/feature/di/getit_di.dart';
import 'package:photo_stock/widgets/photo_grid_item.dart';

/// Class [PhotosGrid] is a [SliverGrid] with [SliverPadding] build by [FutureBuilder]
class PhotosGrid extends StatelessWidget {
  PhotosGrid({Key? key}) : super(key: key);

  final PhotoRepository photoRepository = getIt.get<PhotoRepository>();

  Future<List<Photo>> _fetchData() async {
    return await photoRepository.getPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppSizes.paddingHorizontal),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          childCount: 10,
          (context, index) {
            return FutureBuilder(
                future: _fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return PhotoGridItem(
                      photo: snapshot.data![index],
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                });
          },
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: AppSizes.paddingGridItems,
          crossAxisSpacing: AppSizes.paddingGridItems,
        ),
      ),
    );
  }
}
