import 'package:ditonton_flutter/domain/entities/shows/show.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_popular_shows.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'popular_shows_event.dart';

part 'popular_shows_state.dart';

class PopularShowsBloc extends Bloc<PopularShowsEvent, PopularShowsState> {
  final GetPopularShows _getPopularShows;

  PopularShowsBloc(this._getPopularShows) : super(PopularEmpty()) {
    on<OnPopularShows>((event, emit) async {
      emit(PopularLoading());
      final result = await _getPopularShows.execute();

      result.fold(
        (failure) {
          emit(PopularError(failure.message));
        },
        (data) {
          emit(PopularHasData(data));
        },
      );
    });
  }
}
