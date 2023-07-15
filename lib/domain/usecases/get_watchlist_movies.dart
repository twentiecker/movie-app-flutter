import 'package:dartz/dartz.dart';
import 'package:ditonton_flutter/domain/entities/movie.dart';
import 'package:ditonton_flutter/domain/repositories/movie_repository.dart';
import 'package:ditonton_flutter/common/failure.dart';

class GetWatchlistMovies {
  final MovieRepository _repository;

  GetWatchlistMovies(this._repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return _repository.getWatchlistMovies();
  }
}
