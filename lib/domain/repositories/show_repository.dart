import 'package:dartz/dartz.dart';
import 'package:ditonton_flutter/common/failure.dart';
import 'package:ditonton_flutter/domain/entities/shows/show.dart';
import 'package:ditonton_flutter/domain/entities/shows/show_detail.dart';

abstract class ShowRepository {
  Future<Either<Failure, List<Show>>> getAiringTodayShows();

  Future<Either<Failure, List<Show>>> getPopularShows();

  Future<Either<Failure, List<Show>>> getTopRatedShows();

  Future<Either<Failure, ShowDetail>> getShowDetail(int id);

  Future<Either<Failure, List<Show>>> getShowRecommendations(int id);

  Future<Either<Failure, List<Show>>> searchShows(String query);

  Future<Either<Failure, String>> saveWatchlist(ShowDetail show);

  Future<Either<Failure, String>> removeWatchlist(ShowDetail show);

  Future<bool> isAddedToWatchlist(int id);

  Future<Either<Failure, List<Show>>> getWatchlistShows();
}
