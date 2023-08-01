import 'package:ditonton_flutter/common/state_enum.dart';
import 'package:ditonton_flutter/domain/entities/shows/show.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_watchlist_shows.dart';
import 'package:flutter/foundation.dart';

class WatchlistShowNotifier extends ChangeNotifier {
  var _watchlistShows = <Show>[];

  List<Show> get watchlistShows => _watchlistShows;

  var _watchlistState = RequestState.empty;

  RequestState get watchlistState => _watchlistState;

  String _message = '';

  String get message => _message;

  WatchlistShowNotifier({required this.getWatchlistShows});

  final GetWatchlistShows getWatchlistShows;

  Future<void> fetchWatchlistShows() async {
    _watchlistState = RequestState.loading;
    notifyListeners();

    final result = await getWatchlistShows.execute();
    result.fold(
      (failure) {
        _watchlistState = RequestState.error;
        _message = failure.message;
        notifyListeners();
      },
      (showsData) {
        _watchlistState = RequestState.loaded;
        _watchlistShows = showsData;
        notifyListeners();
      },
    );
  }
}
