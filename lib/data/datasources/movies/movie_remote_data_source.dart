import 'dart:convert';

import 'package:ditonton_flutter/common/exception.dart';
import 'package:ditonton_flutter/data/models/movies/movie_detail_model.dart';
import 'package:ditonton_flutter/data/models/movies/movie_model.dart';
import 'package:ditonton_flutter/data/models/movies/movie_response.dart';
import 'package:http/io_client.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailResponse> getMovieDetail(int id);

  Future<List<MovieModel>> getMovieRecommendations(int id);

  Future<List<MovieModel>> searchMovies(String query);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  static const apiKey = 'api_key=c21b7029b812a242b36580f34db559c6';
  static const baseUrl = 'https://api.themoviedb.org/3';

  // final http.Client client;
  final IOClient client;

  MovieRemoteDataSourceImpl({required this.client});

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response =
        await client.get(Uri.parse('$baseUrl/movie/now_playing?$apiKey'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieDetailResponse> getMovieDetail(int id) async {
    final response = await client.get(Uri.parse('$baseUrl/movie/$id?$apiKey'));

    if (response.statusCode == 200) {
      return MovieDetailResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getMovieRecommendations(int id) async {
    final response = await client
        .get(Uri.parse('$baseUrl/movie/$id/recommendations?$apiKey'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response =
        await client.get(Uri.parse('$baseUrl/movie/popular?$apiKey'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response =
        await client.get(Uri.parse('$baseUrl/movie/top_rated?$apiKey'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    final response = await client
        .get(Uri.parse('$baseUrl/search/movie?$apiKey&query=$query'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }
}
