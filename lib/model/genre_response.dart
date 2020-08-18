import 'package:nobar/model/genre.dart';

import 'genre.dart';

class GenreResponse {
  final List<Genre> genres;
  final String error;

  GenreResponse(this.error,this.genres);

  GenreResponse.fromJson (Map<String, dynamic> json )
      : genres =
  (json["results"] as List).map((i) => new Genre.fromJson(i)).toList(),
        error = "";

  GenreResponse.withError(String errorValue)
      : genres = List(),
        error = errorValue;
}