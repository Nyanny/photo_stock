import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_stock/assets/themes.dart';
import 'package:photo_stock/feature/bloc/photos_bloc.dart';
import 'package:photo_stock/feature/screens/photos_list_screen.dart';
import 'feature/di/getit_di.dart';

/// App's entry point.
Future<void> main() async {
  await dioSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<PhotosBloc>()..add(PhotosFetchEvent()),
      child: MaterialApp(
        theme: AppTheme.appTheme,
        home: const PhotosListScreen(),
      ),
    );
  }
}
