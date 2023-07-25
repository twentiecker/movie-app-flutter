import 'package:ditonton_flutter/data/datasources/db/database_helper.dart';
import 'package:ditonton_flutter/data/datasources/movies/movie_local_data_source.dart';
import 'package:ditonton_flutter/data/datasources/movies/movie_remote_data_source.dart';
import 'package:ditonton_flutter/data/datasources/shows/show_local_data_source.dart';
import 'package:ditonton_flutter/data/datasources/shows/show_remote_data_source.dart';
import 'package:ditonton_flutter/domain/repositories/movie_repository.dart';
import 'package:ditonton_flutter/domain/repositories/show_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

@GenerateMocks([
  MovieRepository,
  MovieRemoteDataSource,
  MovieLocalDataSource,
  DatabaseHelper,
  ShowRepository,
  ShowRemoteDataSource,
  ShowLocalDataSource
], customMocks: [
  // MockSpec<http.Client>(as: #MockHttpClient)
  MockSpec<IOClient>(as: #MockIOClient)
])
void main() {}
