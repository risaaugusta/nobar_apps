import 'package:dio/dio.dart';
import 'package:nobar/model/genre_response.dart';
import 'package:nobar/model/movie_response.dart';
import 'package:nobar/model/person_response.dart';

class MovieRepository{
  final String apiKey = "34e0ac24a9e9e5dfc7ae8867c7233e8b";

  static String  mainUrl ="https://api.themoviedb.org/3";
  final Dio _dio = Dio();
  var getPopularUrl = '$mainUrl/movie/top_rated';
  var getMoviesUrl = '$mainUrl/dicover/movie';
  var getPlayingUrl = '$mainUrl/movie/now_playing';
  var getGenresUrl = '$mainUrl/genre/movie/list';
  var getPersonsUrl = '$mainUrl/trending/perons/week';

  Future<MovieResponse> getMovies()async {
    var params = {
      "api_key" : apiKey,
      "language" : "en-US",
      "page" : 1
    };

    try{
      Response response = await _dio.get(getPopularUrl, queryParameters: params);
          return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace){
      print("Exception occured : $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<MovieResponse> getPlayingMovies()async {
    var params = {
      "api_key" : apiKey,
      "language" : "en-US",
      "page" : 1
    };


    try{
      Response response = await _dio.get(getPlayingUrl, queryParameters: params);
      print(response.data);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace){
      print("Exception occured : $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<GenreResponse> getGenres()async {
    var params = {
      "api_key" : apiKey,
      "language" : "en-US",
      "page" : 1
    };

    try{
      Response response = await _dio.get(getGenresUrl, queryParameters: params);
      return GenreResponse.fromJson(response.data);
    } catch (error, stacktrace){
      print("Exception occured : $error stackTrace: $stacktrace");
      return GenreResponse.withError("$error");
    }
  }

  Future<PersonResponse> getPersons()async {
    var params = {
      "api_key" : apiKey,
      "language" : "en-US",
      "page" : 1
    };

    try{
      Response response = await _dio.get(getPersonsUrl, queryParameters: params);
      return PersonResponse.fromJson(response.data);
    } catch (error, stacktrace){
      print("Exception occured : $error stackTrace: $stacktrace");
      return PersonResponse.withError("$error");
    }
  }

  Future<MovieResponse> getMoviesByGenre(int id)async {
    var params = {
      "api_key" : apiKey,
      "language" : "en-US",
      "page" : 1,
      "with_genres" : id
    };

    try{
      Response response = await _dio.get(getMoviesUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace){
      print("Exception occured : $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }





}