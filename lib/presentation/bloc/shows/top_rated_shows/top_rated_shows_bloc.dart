import 'package:ditonton_flutter/domain/entities/shows/show.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_top_rated_shows.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../top_rated_shows/top_rated_shows_event.dart';

part '../top_rated_shows/top_rated_shows_state.dart';

class TopRatedShowsBloc extends Bloc<TopRatedShowsEvent, TopRatedShowsState> {
  final GetTopRatedShows _getTopRatedShows;

  TopRatedShowsBloc(this._getTopRatedShows) : super(TopRatedEmpty()) {
    on<OnTopRatedShows>((event, emit) async {
      emit(TopRatedLoading());
      final result = await _getTopRatedShows.execute();

      result.fold(
        (failure) {
          emit(TopRatedError(failure.message));
        },
        (data) {
          emit(TopRatedHasData(data));
        },
      );
    });
  }
}
