import 'package:behype_test/data/datasource/home_datasource.dart';
import 'package:behype_test/data/model/unsplash_collections_model.dart';
import 'package:behype_test/data/model/unsplash_photo_model.dart';
import 'package:behype_test/data/model/unsplash_search_result_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeRepository {
  final HomeDataSource _homeDataSource;

  HomeRepository(this._homeDataSource);

  Future<List<UnsplashCollection>> getCollections() async {
    final response = await _homeDataSource.getCollections();
    return unsplashCollectionsFromJson(response.data);
  }

  Future<List<Photo>> getPhotos(int page) async {
    final response = await _homeDataSource.getPhotos(page);

    return photoFromJson(response.data);
  }

  Future<UnsplashSearchResultModel> searchPhotos(int page, String query) async {
    final response = await _homeDataSource.searchPhotos(page, query);

    return searchResultFromJson(response.data);
  }
  Future<List<Photo>> getUserPhotos(String userName) async {
    final response = await _homeDataSource.getUserPhotos(userName);

    return photoFromJson(response.data);
  }
}
