import 'package:ditonton_flutter/data/models/shows/show_model.dart';
import 'package:equatable/equatable.dart';

// import '../movie_model.dart';

class ShowResponse extends Equatable {
  final List<ShowModel> showList;

  ShowResponse({required this.showList});

  factory ShowResponse.fromJson(Map<String, dynamic> json) => ShowResponse(
        showList: List<ShowModel>.from((json["results"] as List)
            .map((x) => ShowModel.fromJson(x))
            .where((element) => element.posterPath != null)),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(showList.map((x) => x.toJson())),
      };

  @override
  List<Object> get props => [showList];
}
