import 'package:behype_test/core/dependencies/injections.dart';
import 'package:behype_test/data/model/unsplash_collections_model.dart';
import 'package:behype_test/data/model/unsplash_photo_model.dart';
import 'package:behype_test/data/repository/home/home_repository.dart';
import 'package:behype_test/domain/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : _homeRepository = getIt<HomeRepository>(),
        super(HomeInitialState());

  final HomeRepository _homeRepository;

  List<UnsplashCollection> _unsplashCollections = [];
  final List<User> _users = [];
  final List<Photo> _unsplashPhotos = [];

  List<Photo> _searchResult = [];

  final PagingController<int, Photo> _pagingController =
      PagingController(firstPageKey: 0);

  PagingController<int, Photo> get getPagingController => _pagingController;

  String? _query;

  Future<void> getAllData() async {
    await getCollections();
    // await getPhotos();
  }

  Future<void> getCollections() async {
    final state = getHomeShowCollectionsState();

    try {
      emit(state.copyWith(isLoading: true));
      final result = await _homeRepository.getCollections();
      _unsplashCollections = result;
      for (UnsplashCollection collection in _unsplashCollections) {
        _users.add(collection.user);
      }
      emit(state.copyWith(
          isLoading: false, unsplashCollections: _unsplashCollections));
    } catch (ex) {
      emit(HomeErrorState(createdAt: DateTime.now(), error: ex.toString()));
    }
  }

  initPaginationControllerListener() async {
    _pagingController.addPageRequestListener((pageKey) async {
      if (_query != null && _query!.isNotEmpty) {
        await searchPhotos(pageKey);
      } else {
        await getPhotos(pageKey);
      }
    });
  }

  HomeShowCollectionsState getHomeShowCollectionsState() {
    return HomeShowCollectionsState(
        isLoading: false,
        unsplashCollections: _unsplashCollections,
        users: _users,
        createdAt: DateTime.now(),
        photos: _unsplashPhotos);
  }

  Future<void> getPhotos(int pageKey) async {
    final state = getHomeShowCollectionsState();

    try {
      final result = await _homeRepository.getPhotos(pageKey);
      _unsplashPhotos.addAll(result);
      final nextPageKey = pageKey + 1;
      _pagingController.appendPage(result, nextPageKey);

      emit(state.copyWith(isLoading: false, photos: _unsplashPhotos));
    } catch (ex) {
      emit(HomeErrorState(createdAt: DateTime.now(), error: ex.toString()));
    }
  }

  Future<void> searchPhotos(int pageKey) async {
    final state = getHomeShowCollectionsState();
    try {
      final result = await _homeRepository.searchPhotos(pageKey, _query ?? '');
      final nextPageKey = pageKey + 1;
      _pagingController.appendPage(result.results, nextPageKey);
      _searchResult.addAll(result.results);

      emit(state.copyWith(isLoading: false, photos: _searchResult));
    } catch (ex) {
      emit(HomeErrorState(createdAt: DateTime.now(), error: ex.toString()));
    }
  }


  void setQuery(String query) {
    _query = query;
    _searchResult = [];
    _pagingController.itemList = []; 
    _pagingController.notifyPageRequestListeners(0);
  }
}
