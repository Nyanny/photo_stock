part of 'photos_bloc.dart';

abstract class PhotosState extends Equatable {
  const PhotosState();

  @override
  List<Object> get props => [];
}

class PhotosInitialState extends PhotosState {}

class PhotosLoadingState extends PhotosState {
  final List<Photo> oldPhotos;
  final bool isFirstFetch;

  const PhotosLoadingState(
      {required this.oldPhotos, this.isFirstFetch = false});

  @override
  List<Object> get props => [oldPhotos];
}

class PhotosLoadedState extends PhotosState {
  final List<Photo> photos;

  const PhotosLoadedState({required this.photos});

  @override
  List<Object> get props => [photos];
}

class PhotosErrorState extends PhotosState {
  final List<Photo>? photosBeforeError;
  final String message;

  const PhotosErrorState(
      {required this.message, required this.photosBeforeError});

  @override
  List<Object> get props => [message];
}
