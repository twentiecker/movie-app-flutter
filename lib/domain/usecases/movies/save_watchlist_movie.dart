import 'package:dartz/dartz.dart';
import 'package:ditonton_flutter/common/failure.dart';
import 'package:ditonton_flutter/domain/entities/movies/movie_detail.dart';
import 'package:ditonton_flutter/domain/repositories/movie_repository.dart';

class SaveWatchlistMovie {
  final MovieRepository repository;

  SaveWatchlistMovie(this.repository);

  Future<Either<Failure, String>> execute(MovieDetail movie) {
    return repository.saveWatchlistMovie(movie);
  }
}
