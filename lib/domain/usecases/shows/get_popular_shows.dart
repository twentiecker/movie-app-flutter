import 'package:dartz/dartz.dart';
import 'package:ditonton_flutter/common/failure.dart';
import 'package:ditonton_flutter/domain/entities/shows/show.dart';
import 'package:ditonton_flutter/domain/repositories/show_repository.dart';

class GetPopularShows {
  final ShowRepository repository;

  GetPopularShows(this.repository);

  Future<Either<Failure, List<Show>>> execute() {
    return repository.getPopularShows();
  }
}
