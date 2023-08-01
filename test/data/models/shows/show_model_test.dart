import 'package:ditonton_flutter/data/models/shows/show_model.dart';
import 'package:ditonton_flutter/domain/entities/shows/show.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tShowModel = ShowModel(
    firstAirDate: 'firstAirDate',
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    name: 'name',
    originalLanguage: 'originalLanguage',
    originalName: 'originalName',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    voteAverage: 1,
    voteCount: 1,
  );

  final tShow = Show(
    backdropPath: 'backdropPath',
    firstAirDate: 'firstAirDate',
    genreIds: const [1, 2, 3],
    id: 1,
    name: 'name',
    originalLanguage: 'originalLanguage',
    originalName: 'originalName',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    voteAverage: 1,
    voteCount: 1,
  );

  test('should be a subclass of Show entity', () async {
    final result = tShowModel.toEntity();
    expect(result, tShow);
  });
}
