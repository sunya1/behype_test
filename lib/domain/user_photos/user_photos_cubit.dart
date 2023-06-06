import 'package:behype_test/core/dependencies/injections.dart';
import 'package:behype_test/data/model/unsplash_photo_model.dart';
import 'package:behype_test/data/repository/home/home_repository.dart';
import 'package:behype_test/domain/user_photos/user_photos_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPhotosCubit extends Cubit<UserPhotosState> {
  UserPhotosCubit()
      : _homeRepository = getIt<HomeRepository>(),
        super(UserPhotosInitialState());

  final HomeRepository _homeRepository;

  List<Photo> _unsplashPhotos = [];
  Photo? _selectedPhoto;

  Future<void> getUserPhotos(String username) async {
    final state = getShowUserPhotosStateState();

    try {
      emit(state.copyWith(isLoading: true));
      final result = await _homeRepository.getUserPhotos(username);
      _unsplashPhotos = result;
      _selectedPhoto = _unsplashPhotos.isNotEmpty ? _unsplashPhotos[0] : null;
      emit(state.copyWith(
          isLoading: false,
          photos: _unsplashPhotos,
          selectedPhoto: _selectedPhoto));
    } catch (ex) {
      emit(ShowUserPhotosErrorState(
          createdAt: DateTime.now(), error: ex.toString()));
    }
  }

  void setSelectedPhoto(Photo selectedPhoto) {
    print("changing");
    final state = getShowUserPhotosStateState();
    _selectedPhoto = selectedPhoto;

    emit(state.copyWith(selectedPhoto: _selectedPhoto));
  }

  ShowUserPhotosState getShowUserPhotosStateState() {
    return ShowUserPhotosState(
        isLoading: false,
        createdAt: DateTime.now(),
        photos: _unsplashPhotos,
        selectedPhoto: _selectedPhoto);
  }
}
