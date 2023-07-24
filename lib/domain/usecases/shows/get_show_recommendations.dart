import 'package:dartz/dartz.dart';
import 'package:ditonton_flutter/domain/entities/shows/show.dart';
import 'package:ditonton_flutter/common/failure.dart';
import 'package:ditonton_flutter/domain/repositories/show_repository.dart';

class GetShowRecommendations {
  final ShowRepository repository;

  GetShowRecommendations(this.repository);

  Future<Either<Failure, List<Show>>> execute(id) {
    return repository.getShowRecommendations(id);
  }
}
