import 'package:dartz/dartz.dart';
import 'package:ditonton_flutter/common/failure.dart';
import 'package:ditonton_flutter/domain/entities/shows/show_detail.dart';
import 'package:ditonton_flutter/domain/repositories/movie_repository.dart';
import 'package:ditonton_flutter/domain/repositories/show_repository.dart';

class RemoveWatchlistShow {
  final ShowRepository repository;

  RemoveWatchlistShow(this.repository);

  Future<Either<Failure, String>> execute(ShowDetail show) {
    return repository.removeWatchlist(show);
  }
}
