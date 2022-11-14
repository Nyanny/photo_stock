import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_stock/api/data/models/photo.dart';
import 'package:photo_stock/api/data/repository/photo_repository.dart';
import 'package:photo_stock/feature/di/getit_di.dart';

part 'photos_event.dart';

part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  final PhotoRepository photoRepository = getIt.get<PhotoRepository>();
  int page = 1;

  PhotosBloc() : super(PhotosInitialState()) {
    on<PhotosFetchEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(
      PhotosFetchEvent event, Emitter<PhotosState> emit) async {
    final currentState = state;

    if (currentState is PhotosLoadingState) return;

    var currentPhotos = <Photo>[];

    if (currentState is PhotosLoadedState) {
      currentPhotos = currentState.photos;
    }

    emit(PhotosLoadingState(oldPhotos: currentPhotos, isFirstFetch: page == 1));

    try {
      final newPhotos = await photoRepository.getPhotos(pageNumber: page);
      page++;
      currentPhotos = (state as PhotosLoadingState).oldPhotos;
      currentPhotos.addAll(newPhotos);
      emit(PhotosLoadedState(photos: currentPhotos));
    } catch (e) {
      currentPhotos = (state as PhotosLoadingState).oldPhotos;
      emit(PhotosErrorState(message: '$e', photosBeforeError: currentPhotos));
    }
  }
}
