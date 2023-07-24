import 'dart:convert';

import 'package:ditonton_flutter/data/datasources/shows/show_remote_data_source.dart';
import 'package:ditonton_flutter/data/models/shows/show_detail_model.dart';
import 'package:ditonton_flutter/data/models/shows/show_response.dart';
import 'package:ditonton_flutter/common/exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';
import '../../../json_reader.dart';

void main() {
  const API_KEY = 'api_key=c21b7029b812a242b36580f34db559c6';
  const BASE_URL = 'https://api.themoviedb.org/3';

  late ShowRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = ShowRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('get Airing Today Shows', () {
    final tShowList = ShowResponse.fromJson(
            json.decode(readJson('dummy_data/shows/airing_today.json')))
        .showList;

    test('should return list of Show Model when the response code is 200',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/airing_today?$API_KEY')))
          .thenAnswer((_) async => http.Response(
              readJson('dummy_data/shows/airing_today.json'), 200));
      // act
      final result = await dataSource.getAiringTodayShows();
      // assert
      expect(result, equals(tShowList));
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/airing_today?$API_KEY')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getAiringTodayShows();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get Popular Shows', () {
    final tShowList = ShowResponse.fromJson(
            json.decode(readJson('dummy_data/shows/popular_show.json')))
        .showList;

    test('should return list of shows when response is success (200)',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY')))
          .thenAnswer((_) async => http.Response(
              readJson('dummy_data/shows/popular_show.json'), 200));
      // act
      final result = await dataSource.getPopularShows();
      // assert
      expect(result, tShowList);
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getPopularShows();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get Top Rated Shows', () {
    final tShowList = ShowResponse.fromJson(
            json.decode(readJson('dummy_data/shows/top_rated_show.json')))
        .showList;

    test('should return list of shows when response code is 200 ', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY')))
          .thenAnswer((_) async => http.Response(
              readJson('dummy_data/shows/top_rated_show.json'), 200));
      // act
      final result = await dataSource.getTopRatedShows();
      // assert
      expect(result, tShowList);
    });

    test('should throw ServerException when response code is other than 200',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getTopRatedShows();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get show detail', () {
    final tId = 1;
    final tShowDetail = ShowDetailResponse.fromJson(
        json.decode(readJson('dummy_data/shows/show_detail.json')));

    test('should return show detail when the response code is 200', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/$tId?$API_KEY')))
          .thenAnswer((_) async => http.Response(
              readJson('dummy_data/shows/show_detail.json'), 200));
      // act
      final result = await dataSource.getShowDetail(tId);
      // assert
      expect(result, equals(tShowDetail));
    });

    test('should throw Server Exception when the response code is 404 or other',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/$tId?$API_KEY')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getShowDetail(tId);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get show recommendations', () {
    final tShowList = ShowResponse.fromJson(
            json.decode(readJson('dummy_data/shows/show_recommendations.json')))
        .showList;
    final tId = 1;

    test('should return list of Show Model when the response code is 200',
        () async {
      // arrange
      when(mockHttpClient
              .get(Uri.parse('$BASE_URL/tv/$tId/recommendations?$API_KEY')))
          .thenAnswer((_) async => http.Response(
              readJson('dummy_data/shows/show_recommendations.json'), 200));
      // act
      final result = await dataSource.getShowRecommendations(tId);
      // assert
      expect(result, equals(tShowList));
    });

    test('should throw Server Exception when the response code is 404 or other',
        () async {
      // arrange
      when(mockHttpClient
              .get(Uri.parse('$BASE_URL/tv/$tId/recommendations?$API_KEY')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getShowRecommendations(tId);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('search shows', () {
    final tSearchResult = ShowResponse.fromJson(json
            .decode(readJson('dummy_data/shows/search_tagesschau_show.json')))
        .showList;
    final tQuery = 'Tagesschau';

    test('should return list of shows when response code is 200', () async {
      // arrange
      when(mockHttpClient
              .get(Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$tQuery')))
          .thenAnswer((_) async => http.Response(
              readJson('dummy_data/shows/search_tagesschau_show.json'), 200));
      // act
      final result = await dataSource.searchShows(tQuery);
      // assert
      expect(result, tSearchResult);
    });

    test('should throw ServerException when response code is other than 200',
        () async {
      // arrange
      when(mockHttpClient
              .get(Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$tQuery')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.searchShows(tQuery);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
}
