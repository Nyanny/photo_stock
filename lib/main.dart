import 'package:flutter/material.dart';
import 'package:photo_stock/assets/themes.dart';
import 'feature/di/getit_di.dart';
import 'feature/screens/photos_list_screen/photos_list_screen.dart';

/// App's entry point.
Future<void> main() async {
  await dioSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme,
      home: const PhotosListScreen(),
    );
  }
}
