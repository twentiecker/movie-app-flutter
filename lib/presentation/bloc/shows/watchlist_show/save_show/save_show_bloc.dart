import 'package:bloc/bloc.dart';
import 'package:ditonton_flutter/domain/entities/shows/show.dart';
import 'package:ditonton_flutter/domain/entities/shows/show_detail.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_show_detail.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_show_recommendations.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_watchlist_show_status.dart';
import 'package:ditonton_flutter/domain/usecases/shows/remove_watchlist_show.dart';
import 'package:ditonton_flutter/domain/usecases/shows/save_watchlist_show.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part '../save_show/save_show_event.dart';

part '../save_show/save_show_state.dart';

class SaveShowBloc extends Bloc<SaveShowEvent, SaveShowState> {
  final SaveWatchlistShow _saveWatchlistShow;

  SaveShowBloc(this._saveWatchlistShow) : super(SaveEmpty()) {
    on<OnSaveFromWatchlist>((event, emit) async {
      final show = event.show;
      await _saveWatchlistShow.execute(show);
    });
  }
}
