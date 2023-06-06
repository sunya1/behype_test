import 'package:behype_test/data/model/unsplash_photo_model.dart';
import 'package:equatable/equatable.dart';

class UserPhotosState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserPhotosInitialState extends UserPhotosState {}

class ShowUserPhotosState extends UserPhotosState {
  final bool isLoading;
  final DateTime? createdAt;
  final List<Photo> photos;
  final Photo? selectedPhoto; 
  ShowUserPhotosState(
      {this.isLoading = false, this.photos = const [], this.createdAt , this.selectedPhoto});
  ShowUserPhotosState copyWith(
          {bool? isLoading = false,
          DateTime? createdAt,
          List<Photo>? photos , 
          Photo? selectedPhoto}) =>
      ShowUserPhotosState(
          isLoading: isLoading ?? this.isLoading,
          createdAt: createdAt ?? this.createdAt,
          photos: photos ?? this.photos , 
          selectedPhoto : selectedPhoto ?? this.selectedPhoto);

  @override
  List<Object?> get props => [isLoading, createdAt, photos , selectedPhoto];
}

class ShowUserPhotosErrorState extends UserPhotosState {
  final DateTime createdAt;
  final String error;
  ShowUserPhotosErrorState({required this.createdAt, required this.error});

  @override
  List<Object?> get props => [createdAt, error];
}
