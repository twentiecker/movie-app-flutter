import 'package:ditonton_flutter/common/state_enum.dart';
import 'package:ditonton_flutter/domain/entities/shows/show.dart';
import 'package:ditonton_flutter/domain/usecases/shows/search_shows.dart';
import 'package:flutter/foundation.dart';

class ShowSearchNotifier extends ChangeNotifier {
  final SearchShows searchShows;

  ShowSearchNotifier({required this.searchShows});

  RequestState _state = RequestState.empty;

  RequestState get state => _state;

  List<Show> _searchResult = [];

  List<Show> get searchResult => _searchResult;

  String _message = '';

  String get message => _message;

  Future<void> fetchShowSearch(String query) async {
    _state = RequestState.loading;
    notifyListeners();

    final result = await searchShows.execute(query);
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
