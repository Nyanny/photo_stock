import 'package:get_it/get_it.dart';
import 'package:photo_stock/api/data/dio/dio_client.dart';
import 'package:photo_stock/api/data/repository/photo_repository.dart';
import 'package:photo_stock/api/photos_api.dart';

/// GetIt instance registration.
final getIt = GetIt.instance;

/// App dependencies.
Future<void> dioSetup() async {
  getIt.registerSingleton<DioClient>(DioClient());
  getIt.registerSingleton<PhotosApi>(PhotosApi());
  getIt.registerSingleton<PhotoRepository>(PhotoRepository());
}
