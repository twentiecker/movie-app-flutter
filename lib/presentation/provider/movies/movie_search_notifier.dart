import 'package:ditonton_flutter/common/state_enum.dart';
import 'package:ditonton_flutter/domain/entities/movies/movie.dart';
import 'package:ditonton_flutter/domain/usecases/movies/search_movies.dart';
import 'package:flutter/foundation.dart';

class MovieSearchNotifier extends ChangeNotifier {
  final SearchMovies searchMovies;

  MovieSearchNotifier({required this.searchMovies});

  RequestState _state = RequestState.empty;

  RequestState get state => _state;

  List<Movie> _searchResult = [];

  List<Movie> get searchResult => _searchResult;

  String _message = '';

  String get message => _message;

  Future<void> fetchMovieSearch(String query) async {
    _state = RequestState.loading;
    notifyListeners();

    final result = await searchMovies.execute(query);
    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.error;
        notifyListeners();
      },
      (data) {
        _searchResult = data;
        _state = RequestState.loaded;
        notifyListeners();
      },
    );
  }
}
