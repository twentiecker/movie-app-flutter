import 'package:bloc/bloc.dart';
import 'package:ditonton_flutter/domain/entities/shows/show.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_show_detail.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_show_recommendations.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part '../show_recommendations/show_recommendations_event.dart';

part '../show_recommendations/show_recommendations_state.dart';

class ShowRecommendationsBloc extends Bloc<ShowRecommendationsEvent, ShowRecommendationsState> {
  final GetShowRecommendations _getShowRecommendations;

  ShowRecommendationsBloc(this._getShowRecommendations) : super(RecommendationsEmpty()) {
    on<OnShowRecommendations>((event, emit) async {
      final id = event.id;

      emit(RecommendationsLoading());
      final result = await _getShowRecommendations.execute(id);

      result.fold(
        (failure) {
          emit(RecommendationsError(failure.message));
        },
        (data) {
          emit(RecommendationsHasData(data));
        },
      );
    });
  }
}
