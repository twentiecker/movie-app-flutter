import 'dart:convert';

import 'package:ditonton_flutter/data/models/shows/show_model.dart';
import 'package:ditonton_flutter/data/models/shows/show_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../json_reader.dart';

void main() {
  const tShowModel = ShowModel(
      backdropPath: "/jWXrQstj7p3Wl5MfYWY6IHqRpDb.jpg",
      firstAirDate: "1952-12-26",
      genreIds: [10763],
      id: 94722,
      name: "Tagesschau",
      originalLanguage: "de",
      originalName: "Tagesschau",
      overview:
          "German daily news program, the oldest still existing program on German television.",
      popularity: 2918.048,
      posterPath: "/7dFZJ2ZJJdcmkp05B9NWlqTJ5tq.jpg",
      voteAverage: 7.3,
      voteCount: 24);
  const tShowResponseModel = ShowResponse(showList: <ShowModel>[tShowModel]);
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('dummy_data/shows/airing_today.json'));
      // act
      final result = ShowResponse.fromJson(jsonMap);
      // assert
      expect(result, tShowResponseModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // arrange

      // act
      final result = tShowResponseModel.toJson();
      // assert
      final expectedJsonMap = {
        "results": [
          {
            "backdrop_path": "/jWXrQstj7p3Wl5MfYWY6IHqRpDb.jpg",
            "first_air_date": "1952-12-26",
            "genre_ids": [10763],
            "id": 94722,
            "name": "Tagesschau",
            "original_language": "de",
            "original_name": "Tagesschau",
            "overview":
                "German daily news program, the oldest still existing program on German television.",
            "popularity": 2918.048,
            "poster_path": "/7dFZJ2ZJJdcmkp05B9NWlqTJ5tq.jpg",
            "vote_average": 7.3,
            "vote_count": 24
          }
        ],
      };
      expect(result, expectedJsonMap);
    });
  });
}
