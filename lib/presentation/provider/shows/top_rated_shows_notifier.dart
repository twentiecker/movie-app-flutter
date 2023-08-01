import 'package:ditonton_flutter/common/state_enum.dart';
import 'package:ditonton_flutter/domain/entities/shows/show.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_top_rated_shows.dart';
import 'package:flutter/foundation.dart';

class TopRatedShowsNotifier extends ChangeNotifier {
  final GetTopRatedShows getTopRatedShows;

  TopRatedShowsNotifier({required this.getTopRatedShows});

  RequestState _state = RequestState.empty;

  RequestState get state => _state;

  List<Show> _shows = [];

  List<Show> get shows => _shows;

  String _message = '';

  String get message => _message;

  Future<void> fetchTopRatedShows() async {
    _state = RequestState.loading;
    notifyListeners();

    final result = await getTopRatedShows.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.error;
        notifyListeners();
      },
      (showsData) {
        _shows = showsData;
        _state = RequestState.loaded;
        notifyListeners();
      },
    );
  }
}
