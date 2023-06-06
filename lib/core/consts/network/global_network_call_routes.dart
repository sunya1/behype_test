class GlobalNetworkCallRoutes {
  static String getCollections = '/collections';
  static String getPhotos = '/photos';
  static String searchPhotos = '/search/photos';
  static String getUserPhotos(String userName) => '/users/$userName/photos';
}
