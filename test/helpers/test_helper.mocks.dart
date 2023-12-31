// Mocks generated by Mockito 5.4.2 from annotations
// in ditonton_flutter/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:convert' as _i26;
import 'dart:typed_data' as _i27;

import 'package:dartz/dartz.dart' as _i2;
import 'package:ditonton_flutter/common/failure.dart' as _i9;
import 'package:ditonton_flutter/data/datasources/db/database_helper.dart'
    as _i16;
import 'package:ditonton_flutter/data/datasources/movies/movie_local_data_source.dart'
    as _i14;
import 'package:ditonton_flutter/data/datasources/movies/movie_remote_data_source.dart'
    as _i12;
import 'package:ditonton_flutter/data/datasources/shows/show_local_data_source.dart'
    as _i24;
import 'package:ditonton_flutter/data/datasources/shows/show_remote_data_source.dart'
    as _i22;
import 'package:ditonton_flutter/data/models/movies/movie_detail_model.dart'
    as _i3;
import 'package:ditonton_flutter/data/models/movies/movie_model.dart' as _i13;
import 'package:ditonton_flutter/data/models/movies/movie_table.dart' as _i15;
import 'package:ditonton_flutter/data/models/shows/show_detail_model.dart'
    as _i4;
import 'package:ditonton_flutter/data/models/shows/show_model.dart' as _i23;
import 'package:ditonton_flutter/data/models/shows/show_table.dart' as _i18;
import 'package:ditonton_flutter/domain/entities/movies/movie.dart' as _i10;
import 'package:ditonton_flutter/domain/entities/movies/movie_detail.dart'
    as _i11;
import 'package:ditonton_flutter/domain/entities/shows/show.dart' as _i20;
import 'package:ditonton_flutter/domain/entities/shows/show_detail.dart'
    as _i21;
import 'package:ditonton_flutter/domain/repositories/movie_repository.dart'
    as _i7;
import 'package:ditonton_flutter/domain/repositories/show_repository.dart'
    as _i19;
import 'package:http/io_client.dart' as _i5;
import 'package:http/src/base_request.dart' as _i25;
import 'package:http/src/response.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;
import 'package:sqflite/sqflite.dart' as _i17;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMovieDetailResponse_1 extends _i1.SmartFake
    implements _i3.MovieDetailResponse {
  _FakeMovieDetailResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeShowDetailResponse_2 extends _i1.SmartFake
    implements _i4.ShowDetailResponse {
  _FakeShowDetailResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIOStreamedResponse_3 extends _i1.SmartFake
    implements _i5.IOStreamedResponse {
  _FakeIOStreamedResponse_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_4 extends _i1.SmartFake implements _i6.Response {
  _FakeResponse_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepository extends _i1.Mock implements _i7.MovieRepository {
  MockMovieRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>> getNowPlayingMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getNowPlayingMovies,
          [],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>.value(
                _FakeEither_0<_i9.Failure, List<_i10.Movie>>(
          this,
          Invocation.method(
            #getNowPlayingMovies,
            [],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>> getPopularMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularMovies,
          [],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>.value(
                _FakeEither_0<_i9.Failure, List<_i10.Movie>>(
          this,
          Invocation.method(
            #getPopularMovies,
            [],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>> getTopRatedMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedMovies,
          [],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>.value(
                _FakeEither_0<_i9.Failure, List<_i10.Movie>>(
          this,
          Invocation.method(
            #getTopRatedMovies,
            [],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, _i11.MovieDetail>> getMovieDetail(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieDetail,
          [id],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, _i11.MovieDetail>>.value(
                _FakeEither_0<_i9.Failure, _i11.MovieDetail>(
          this,
          Invocation.method(
            #getMovieDetail,
            [id],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, _i11.MovieDetail>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>> getMovieRecommendations(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieRecommendations,
          [id],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>.value(
                _FakeEither_0<_i9.Failure, List<_i10.Movie>>(
          this,
          Invocation.method(
            #getMovieRecommendations,
            [id],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>> searchMovies(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchMovies,
          [query],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>.value(
                _FakeEither_0<_i9.Failure, List<_i10.Movie>>(
          this,
          Invocation.method(
            #searchMovies,
            [query],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, String>> saveWatchlistMovie(
          _i11.MovieDetail? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveWatchlistMovie,
          [movie],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, String>>.value(
            _FakeEither_0<_i9.Failure, String>(
          this,
          Invocation.method(
            #saveWatchlistMovie,
            [movie],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, String>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, String>> removeWatchlistMovie(
          _i11.MovieDetail? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlistMovie,
          [movie],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, String>>.value(
            _FakeEither_0<_i9.Failure, String>(
          this,
          Invocation.method(
            #removeWatchlistMovie,
            [movie],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, String>>);
  @override
  _i8.Future<bool> isAddedToWatchlistMovie(int? id) => (super.noSuchMethod(
        Invocation.method(
          #isAddedToWatchlistMovie,
          [id],
        ),
        returnValue: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>> getWatchlistMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistMovies,
          [],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>.value(
                _FakeEither_0<_i9.Failure, List<_i10.Movie>>(
          this,
          Invocation.method(
            #getWatchlistMovies,
            [],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>);
}

/// A class which mocks [MovieRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRemoteDataSource extends _i1.Mock
    implements _i12.MovieRemoteDataSource {
  MockMovieRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<List<_i13.MovieModel>> getNowPlayingMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getNowPlayingMovies,
          [],
        ),
        returnValue:
            _i8.Future<List<_i13.MovieModel>>.value(<_i13.MovieModel>[]),
      ) as _i8.Future<List<_i13.MovieModel>>);
  @override
  _i8.Future<List<_i13.MovieModel>> getPopularMovies() => (super.noSuchMethod(
        Invocation.method(
          #getPopularMovies,
          [],
        ),
        returnValue:
            _i8.Future<List<_i13.MovieModel>>.value(<_i13.MovieModel>[]),
      ) as _i8.Future<List<_i13.MovieModel>>);
  @override
  _i8.Future<List<_i13.MovieModel>> getTopRatedMovies() => (super.noSuchMethod(
        Invocation.method(
          #getTopRatedMovies,
          [],
        ),
        returnValue:
            _i8.Future<List<_i13.MovieModel>>.value(<_i13.MovieModel>[]),
      ) as _i8.Future<List<_i13.MovieModel>>);
  @override
  _i8.Future<_i3.MovieDetailResponse> getMovieDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieDetail,
          [id],
        ),
        returnValue: _i8.Future<_i3.MovieDetailResponse>.value(
            _FakeMovieDetailResponse_1(
          this,
          Invocation.method(
            #getMovieDetail,
            [id],
          ),
        )),
      ) as _i8.Future<_i3.MovieDetailResponse>);
  @override
  _i8.Future<List<_i13.MovieModel>> getMovieRecommendations(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieRecommendations,
          [id],
        ),
        returnValue:
            _i8.Future<List<_i13.MovieModel>>.value(<_i13.MovieModel>[]),
      ) as _i8.Future<List<_i13.MovieModel>>);
  @override
  _i8.Future<List<_i13.MovieModel>> searchMovies(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchMovies,
          [query],
        ),
        returnValue:
            _i8.Future<List<_i13.MovieModel>>.value(<_i13.MovieModel>[]),
      ) as _i8.Future<List<_i13.MovieModel>>);
}

/// A class which mocks [MovieLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieLocalDataSource extends _i1.Mock
    implements _i14.MovieLocalDataSource {
  MockMovieLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<String> insertWatchlist(_i15.MovieTable? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchlist,
          [movie],
        ),
        returnValue: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
  @override
  _i8.Future<String> removeWatchlist(_i15.MovieTable? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [movie],
        ),
        returnValue: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
  @override
  _i8.Future<_i15.MovieTable?> getMovieById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getMovieById,
          [id],
        ),
        returnValue: _i8.Future<_i15.MovieTable?>.value(),
      ) as _i8.Future<_i15.MovieTable?>);
  @override
  _i8.Future<List<_i15.MovieTable>> getWatchlistMovies() => (super.noSuchMethod(
        Invocation.method(
          #getWatchlistMovies,
          [],
        ),
        returnValue:
            _i8.Future<List<_i15.MovieTable>>.value(<_i15.MovieTable>[]),
      ) as _i8.Future<List<_i15.MovieTable>>);
}

/// A class which mocks [DatabaseHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelper extends _i1.Mock implements _i16.DatabaseHelper {
  MockDatabaseHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i17.Database?> get database => (super.noSuchMethod(
        Invocation.getter(#database),
        returnValue: _i8.Future<_i17.Database?>.value(),
      ) as _i8.Future<_i17.Database?>);
  @override
  _i8.Future<int> insertWatchlist(_i15.MovieTable? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchlist,
          [movie],
        ),
        returnValue: _i8.Future<int>.value(0),
      ) as _i8.Future<int>);
  @override
  _i8.Future<int> removeWatchlist(_i15.MovieTable? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [movie],
        ),
        returnValue: _i8.Future<int>.value(0),
      ) as _i8.Future<int>);
  @override
  _i8.Future<Map<String, dynamic>?> getMovieById(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieById,
          [id],
        ),
        returnValue: _i8.Future<Map<String, dynamic>?>.value(),
      ) as _i8.Future<Map<String, dynamic>?>);
  @override
  _i8.Future<List<Map<String, dynamic>>> getWatchlistMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistMovies,
          [],
        ),
        returnValue: _i8.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i8.Future<List<Map<String, dynamic>>>);
  @override
  _i8.Future<int> insertWatchlistShow(_i18.ShowTable? show) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchlistShow,
          [show],
        ),
        returnValue: _i8.Future<int>.value(0),
      ) as _i8.Future<int>);
  @override
  _i8.Future<int> removeWatchlistShow(_i18.ShowTable? show) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlistShow,
          [show],
        ),
        returnValue: _i8.Future<int>.value(0),
      ) as _i8.Future<int>);
  @override
  _i8.Future<Map<String, dynamic>?> getShowById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getShowById,
          [id],
        ),
        returnValue: _i8.Future<Map<String, dynamic>?>.value(),
      ) as _i8.Future<Map<String, dynamic>?>);
  @override
  _i8.Future<List<Map<String, dynamic>>> getWatchlistShows() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistShows,
          [],
        ),
        returnValue: _i8.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i8.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [ShowRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockShowRepository extends _i1.Mock implements _i19.ShowRepository {
  MockShowRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i20.Show>>> getAiringTodayShows() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAiringTodayShows,
          [],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, List<_i20.Show>>>.value(
            _FakeEither_0<_i9.Failure, List<_i20.Show>>(
          this,
          Invocation.method(
            #getAiringTodayShows,
            [],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i20.Show>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i20.Show>>> getPopularShows() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularShows,
          [],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, List<_i20.Show>>>.value(
            _FakeEither_0<_i9.Failure, List<_i20.Show>>(
          this,
          Invocation.method(
            #getPopularShows,
            [],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i20.Show>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i20.Show>>> getTopRatedShows() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedShows,
          [],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, List<_i20.Show>>>.value(
            _FakeEither_0<_i9.Failure, List<_i20.Show>>(
          this,
          Invocation.method(
            #getTopRatedShows,
            [],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i20.Show>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, _i21.ShowDetail>> getShowDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getShowDetail,
          [id],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, _i21.ShowDetail>>.value(
            _FakeEither_0<_i9.Failure, _i21.ShowDetail>(
          this,
          Invocation.method(
            #getShowDetail,
            [id],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, _i21.ShowDetail>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i20.Show>>> getShowRecommendations(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getShowRecommendations,
          [id],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, List<_i20.Show>>>.value(
            _FakeEither_0<_i9.Failure, List<_i20.Show>>(
          this,
          Invocation.method(
            #getShowRecommendations,
            [id],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i20.Show>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i20.Show>>> searchShows(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchShows,
          [query],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, List<_i20.Show>>>.value(
            _FakeEither_0<_i9.Failure, List<_i20.Show>>(
          this,
          Invocation.method(
            #searchShows,
            [query],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i20.Show>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, String>> saveWatchlistShow(
          _i21.ShowDetail? show) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveWatchlistShow,
          [show],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, String>>.value(
            _FakeEither_0<_i9.Failure, String>(
          this,
          Invocation.method(
            #saveWatchlistShow,
            [show],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, String>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, String>> removeWatchlistShow(
          _i21.ShowDetail? show) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlistShow,
          [show],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, String>>.value(
            _FakeEither_0<_i9.Failure, String>(
          this,
          Invocation.method(
            #removeWatchlistShow,
            [show],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, String>>);
  @override
  _i8.Future<bool> isAddedToWatchlistShow(int? id) => (super.noSuchMethod(
        Invocation.method(
          #isAddedToWatchlistShow,
          [id],
        ),
        returnValue: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i20.Show>>> getWatchlistShows() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistShows,
          [],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, List<_i20.Show>>>.value(
            _FakeEither_0<_i9.Failure, List<_i20.Show>>(
          this,
          Invocation.method(
            #getWatchlistShows,
            [],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i20.Show>>>);
}

/// A class which mocks [ShowRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockShowRemoteDataSource extends _i1.Mock
    implements _i22.ShowRemoteDataSource {
  MockShowRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<List<_i23.ShowModel>> getAiringTodayShows() => (super.noSuchMethod(
        Invocation.method(
          #getAiringTodayShows,
          [],
        ),
        returnValue: _i8.Future<List<_i23.ShowModel>>.value(<_i23.ShowModel>[]),
      ) as _i8.Future<List<_i23.ShowModel>>);
  @override
  _i8.Future<List<_i23.ShowModel>> getPopularShows() => (super.noSuchMethod(
        Invocation.method(
          #getPopularShows,
          [],
        ),
        returnValue: _i8.Future<List<_i23.ShowModel>>.value(<_i23.ShowModel>[]),
      ) as _i8.Future<List<_i23.ShowModel>>);
  @override
  _i8.Future<List<_i23.ShowModel>> getTopRatedShows() => (super.noSuchMethod(
        Invocation.method(
          #getTopRatedShows,
          [],
        ),
        returnValue: _i8.Future<List<_i23.ShowModel>>.value(<_i23.ShowModel>[]),
      ) as _i8.Future<List<_i23.ShowModel>>);
  @override
  _i8.Future<_i4.ShowDetailResponse> getShowDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getShowDetail,
          [id],
        ),
        returnValue:
            _i8.Future<_i4.ShowDetailResponse>.value(_FakeShowDetailResponse_2(
          this,
          Invocation.method(
            #getShowDetail,
            [id],
          ),
        )),
      ) as _i8.Future<_i4.ShowDetailResponse>);
  @override
  _i8.Future<List<_i23.ShowModel>> getShowRecommendations(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getShowRecommendations,
          [id],
        ),
        returnValue: _i8.Future<List<_i23.ShowModel>>.value(<_i23.ShowModel>[]),
      ) as _i8.Future<List<_i23.ShowModel>>);
  @override
  _i8.Future<List<_i23.ShowModel>> searchShows(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchShows,
          [query],
        ),
        returnValue: _i8.Future<List<_i23.ShowModel>>.value(<_i23.ShowModel>[]),
      ) as _i8.Future<List<_i23.ShowModel>>);
}

/// A class which mocks [ShowLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockShowLocalDataSource extends _i1.Mock
    implements _i24.ShowLocalDataSource {
  MockShowLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<String> insertWatchlist(_i18.ShowTable? show) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchlist,
          [show],
        ),
        returnValue: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
  @override
  _i8.Future<String> removeWatchlist(_i18.ShowTable? show) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [show],
        ),
        returnValue: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
  @override
  _i8.Future<_i18.ShowTable?> getShowById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getShowById,
          [id],
        ),
        returnValue: _i8.Future<_i18.ShowTable?>.value(),
      ) as _i8.Future<_i18.ShowTable?>);
  @override
  _i8.Future<List<_i18.ShowTable>> getWatchlistShows() => (super.noSuchMethod(
        Invocation.method(
          #getWatchlistShows,
          [],
        ),
        returnValue: _i8.Future<List<_i18.ShowTable>>.value(<_i18.ShowTable>[]),
      ) as _i8.Future<List<_i18.ShowTable>>);
}

/// A class which mocks [IOClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockIOClient extends _i1.Mock implements _i5.IOClient {
  MockIOClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i5.IOStreamedResponse> send(_i25.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i8.Future<_i5.IOStreamedResponse>.value(_FakeIOStreamedResponse_3(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i8.Future<_i5.IOStreamedResponse>);
  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i8.Future<_i6.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<_i6.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<_i6.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i26.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<_i6.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i26.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<_i6.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i26.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<_i6.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i26.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
  @override
  _i8.Future<_i27.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i27.Uint8List>.value(_i27.Uint8List(0)),
      ) as _i8.Future<_i27.Uint8List>);
}
