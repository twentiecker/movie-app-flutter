import 'package:dartz/dartz.dart';
import 'package:ditonton_flutter/domain/entities/shows/show_detail.dart';
import 'package:ditonton_flutter/common/failure.dart';
import 'package:ditonton_flutter/domain/repositories/show_repository.dart';

class GetShowDetail {
  final ShowRepository repository;

  GetShowDetail(this.repository);

  Future<Either<Failure, ShowDetail>> execute(int id) {
    return repository.getShowDetail(id);
  }
}
