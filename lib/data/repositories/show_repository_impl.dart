import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ditonton_flutter/data/datasources/shows/show_local_data_source.dart';
import 'package:ditonton_flutter/data/datasources/shows/show_remote_data_source.dart';
import 'package:ditonton_flutter/data/models/shows/show_table.dart';
import 'package:ditonton_flutter/domain/entities/shows/show.dart';
import 'package:ditonton_flutter/domain/entities/shows/show_detail.dart';
import 'package:ditonton_flutter/common/exception.dart';
import 'package:ditonton_flutter/common/failure.dart';
import 'package:ditonton_flutter/domain/repositories/show_repository.dart';

class ShowRepositoryImpl implements ShowRepository {
  final ShowRemoteDataSource remoteDataSource;
  final ShowLocalDataSource localDataSource;

  ShowRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Show>>> getAiringTodayShows() async {
    try {
      final result = await remoteDataSource.getAiringTodayShows();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, ShowDetail>> getShowDetail(int id) async {
    try {
      final result = await remoteDataSource.getShowDetail(id);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Show>>> getShowRecommendations(int id) async {
    try {
      final result = await remoteDataSource.getShowRecommendations(id);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Show>>> getPopularShows() async {
    try {
      final result = await remoteDataSource.getPopularShows();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Show>>> getTopRatedShows() async {
    try {
      final result = await remoteDataSource.getTopRatedShows();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Show>>> searchShows(String query) async {
    try {
      final result = await remoteDataSource.searchShows(query);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, String>> saveWatchlistShow(ShowDetail show) async {
    try {
      final result =
          await localDataSource.insertWatchlist(ShowTable.fromEntity(show));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, String>> removeWatchlistShow(ShowDetail show) async {
    try {
      final result =
          await localDataSource.removeWatchlist(ShowTable.fromEntity(show));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<bool> isAddedToWatchlistShow(int id) async {
    final result = await localDataSource.getShowById(id);
    return result != null;
  }

  @override
  Future<Either<Failure, List<Show>>> getWatchlistShows() async {
    final result = await localDataSource.getWatchlistShows();
    return Right(result.map((data) => data.toEntity()).toList());
  }
}
