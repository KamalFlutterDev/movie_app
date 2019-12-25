import 'package:movie_app/models/item_model.dart';
import 'package:movie_app/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {

  final _repository = Repository();
  final _moviesFetcher = PublishSubject<ItemModel>();

  Observable<ItemModel> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    ItemModel itemModel = await _repository.fetchMoviesList();
    _moviesFetcher.sink.add(itemModel); 
  }

  dispose() {
    _moviesFetcher?.close();
  }
}
final bloc = MoviesBloc();