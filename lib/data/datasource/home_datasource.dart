import 'package:behype_test/core/consts/network/global_network_call_routes.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeDataSource {
  final Dio _unsplashDio;
  HomeDataSource(@Named("unsplashDio") this._unsplashDio);

  Future<Response> getCollections() async {
    final response = await _unsplashDio.get(
        GlobalNetworkCallRoutes.getCollections,
        queryParameters: {'per_page': 20});

    return response;
  }

  Future<Response> getPhotos(int page) async {
    final response = await _unsplashDio.get(GlobalNetworkCallRoutes.getPhotos,
        queryParameters: {'page': page});

    return response;
  }

  Future<Response> searchPhotos(int page, String query) async {
    final response = await _unsplashDio.get(
        GlobalNetworkCallRoutes.searchPhotos,
        queryParameters: {'page': page, 'query': query});

    return response;
  }

  Future<Response> getUserPhotos(String userName) async {
    final response =
        await _unsplashDio.get(GlobalNetworkCallRoutes.getUserPhotos(userName));
    return response; 
  }
}
