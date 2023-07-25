import 'dart:convert';

import 'package:ditonton_flutter/common/exception.dart';
import 'package:ditonton_flutter/data/models/shows/show_detail_model.dart';
import 'package:ditonton_flutter/data/models/shows/show_model.dart';
import 'package:ditonton_flutter/data/models/shows/show_response.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

abstract class ShowRemoteDataSource {
  Future<List<ShowModel>> getAiringTodayShows();

  Future<List<ShowModel>> getPopularShows();

  Future<List<ShowModel>> getTopRatedShows();

  Future<ShowDetailResponse> getShowDetail(int id);

  Future<List<ShowModel>> getShowRecommendations(int id);

  Future<List<ShowModel>> searchShows(String query);
}

class ShowRemoteDataSourceImpl implements ShowRemoteDataSource {
  static const API_KEY = 'api_key=c21b7029b812a242b36580f34db559c6';
  static const BASE_URL = 'https://api.themoviedb.org/3';

  // final http.Client client;
  final IOClient client;

  ShowRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ShowModel>> getAiringTodayShows() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/tv/airing_today?$API_KEY'));

    if (response.statusCode == 200) {
      return ShowResponse.fromJson(json.decode(response.body)).showList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ShowDetailResponse> getShowDetail(int id) async {
    final response = await client.get(Uri.parse('$BASE_URL/tv/$id?$API_KEY'));

    if (response.statusCode == 200) {
      return ShowDetailResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ShowModel>> getShowRecommendations(int id) async {
    final response = await client
        .get(Uri.parse('$BASE_URL/tv/$id/recommendations?$API_KEY'));

    if (response.statusCode == 200) {
      return ShowResponse.fromJson(json.decode(response.body)).showList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ShowModel>> getPopularShows() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY'));

    if (response.statusCode == 200) {
      return ShowResponse.fromJson(json.decode(response.body)).showList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ShowModel>> getTopRatedShows() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY'));

    if (response.statusCode == 200) {
      return ShowResponse.fromJson(json.decode(response.body)).showList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ShowModel>> searchShows(String query) async {
    final response = await client
        .get(Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$query'));

    if (response.statusCode == 200) {
      return ShowResponse.fromJson(json.decode(response.body)).showList;
    } else {
      throw ServerException();
    }
  }
}
