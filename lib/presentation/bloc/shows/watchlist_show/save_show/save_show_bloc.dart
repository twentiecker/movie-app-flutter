import 'package:ditonton_flutter/domain/entities/shows/show_detail.dart';
import 'package:ditonton_flutter/domain/usecases/shows/save_watchlist_show.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
