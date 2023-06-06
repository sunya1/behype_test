import 'package:behype_test/data/model/unsplash_collections_model.dart';
import 'package:behype_test/data/model/unsplash_photo_model.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeShowCollectionsState extends HomeState {
  final bool isLoading;
  final List<UnsplashCollection> unsplashCollections;
  final DateTime? createdAt;
  final List<User> users;
  final List<Photo> photos; 
  HomeShowCollectionsState(
      {this.isLoading = false,
      this.unsplashCollections = const [],
      this.users = const [],
      this.photos  = const [] , 
      this.createdAt});
  HomeShowCollectionsState copyWith(
          {List<UnsplashCollection>? unsplashCollections,
          bool? isLoading = false,
          DateTime? createdAt,
          List<User>? users , 
          List<Photo>? photos }) =>
      HomeShowCollectionsState(
        unsplashCollections: unsplashCollections ?? this.unsplashCollections,
        isLoading: isLoading ?? this.isLoading,
        users: users ?? this.users,
        createdAt: createdAt ?? this.createdAt,
        photos : photos ?? this.photos
      );

  @override
  List<Object?> get props => [unsplashCollections, isLoading, createdAt, users , photos];
}

class HomeErrorState extends HomeState {
  final DateTime createdAt;
  final String error;
  HomeErrorState({required this.createdAt, required this.error});

  @override
  List<Object?> get props => [createdAt, error];
}
