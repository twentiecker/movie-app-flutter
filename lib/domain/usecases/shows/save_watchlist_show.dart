import 'package:dartz/dartz.dart';
import 'package:ditonton_flutter/common/failure.dart';
import 'package:ditonton_flutter/domain/entities/shows/show_detail.dart';
import 'package:ditonton_flutter/domain/repositories/show_repository.dart';

class SaveWatchlistShow {
  final ShowRepository repository;

  SaveWatchlistShow(this.repository);

  Future<Either<Failure, String>> execute(ShowDetail show) {
    return repository.saveWatchlist(show);
  }
}
