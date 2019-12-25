import 'package:movie_app/models/item_model.dart';

import 'movie_api_provider.dart';
import 'dart:async';

class Repository {
  final MovieApiProvider _movieApiProvider = MovieApiProvider();

  Future<ItemModel> fetchMoviesList() => _movieApiProvider.fetchMovieList();
}
