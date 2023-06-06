import 'package:behype_test/data/model/unsplash_photo_model.dart';

UnsplashSearchResultModel searchResultFromJson(dynamic str) =>
    UnsplashSearchResultModel.fromJson(str);

class UnsplashSearchResultModel {
  List<Photo> results;

  UnsplashSearchResultModel({
    required this.results,
  });

  factory UnsplashSearchResultModel.fromJson(Map<String, dynamic> json) =>
      UnsplashSearchResultModel(
        results:
            List<Photo>.from(json["results"].map((x) => Photo.fromJson(x))),
      );
}
