import 'package:ditonton_flutter/domain/entities/shows/show.dart';
import 'package:ditonton_flutter/domain/entities/shows/show_detail.dart';
import 'package:equatable/equatable.dart';

class ShowTable extends Equatable {
  final int id;
  final String? name;
  final String? posterPath;
  final String? overview;

  const ShowTable({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.overview,
  });

  factory ShowTable.fromEntity(ShowDetail show) => ShowTable(
        id: show.id,
        name: show.name,
        posterPath: show.posterPath,
        overview: show.overview,
      );

  factory ShowTable.fromMap(Map<String, dynamic> map) => ShowTable(
        id: map['id'],
        name: map['name'],
        posterPath: map['posterPath'],
        overview: map['overview'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'posterPath': posterPath,
        'overview': overview,
      };

  Show toEntity() => Show.watchlist(
        id: id,
        overview: overview,
        posterPath: posterPath,
        name: name,
      );

  @override
  List<Object?> get props => [id, name, posterPath, overview];
}
