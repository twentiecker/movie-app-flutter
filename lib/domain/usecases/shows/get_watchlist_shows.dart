import 'package:dartz/dartz.dart';
import 'package:ditonton_flutter/domain/entities/movies/movie.dart';
import 'package:ditonton_flutter/domain/entities/shows/show.dart';
import 'package:ditonton_flutter/domain/repositories/movie_repository.dart';
import 'package:ditonton_flutter/common/failure.dart';
import 'package:ditonton_flutter/domain/repositories/show_repository.dart';

class GetWatchlistShows {
  final ShowRepository _repository;

  GetWatchlistShows(this._repository);

  Future<Either<Failure, List<Show>>> execute() {
    return _repository.getWatchlistShows();
  }
}
