import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_app/models/movie.dart';
import 'package:test_app/models/movie_detail.dart';
import 'package:test_app/models/tv_show.dart';
import 'package:test_app/models/tv_show_detail.dart';

class ApiService {
  final String _baseUrl = "https://api.themoviedb.org/3/";
  final String _bearerToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2ZWU2MTAyMDBiOGVjZWEwOGU0NDNmZmYyNzA4MjBjOSIsIm5iZiI6MTY4OTg0ODM5Mi45MjUsInN1YiI6IjY0YjkwYTQ4MzAwOWFhMDBmZmJlZjcyZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.i4RyA4hSaYk_fHkoDqQ_GgOWVWt82eFeszDByhVNo_k";
  static final String imgBaseUrl = "https://image.tmdb.org/t/p/w500/";
  static final String seasonPosterPath =
      "https://media.themoviedb.org/t/p/w260_and_h390_face/";

  Future<List<Movie>> fetchPopularMovies() async {
    var url = Uri.parse("${_baseUrl}movie/popular");
    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer $_bearerToken",
      },
    );
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      final result = responseJson['results'] as List;
      return result.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load movies.");
    }
  }

  Future<MovieDetail> fetchMovieDetail(int id) async {
    var url = Uri.parse("${_baseUrl}movie/$id");
    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer $_bearerToken",
      },
    );
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      return MovieDetail.fromJson(responseJson);
    } else {
      throw Exception("Failed to load movie detail.");
    }
  }

  Future<List<TvShow>> fetchPopularSeries() async {
    var url = Uri.parse("${_baseUrl}tv/popular");
    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer $_bearerToken",
      },
    );
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      final results = responseJson['results'] as List;
      return results.map((json) => TvShow.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load series.");
    }
  }

  Future<TvShowDetail> fetchTvShowDetail(int? id) async {
    var url = Uri.parse("${_baseUrl}tv/$id");
    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer $_bearerToken",
      },
    );
    final responseJson = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return TvShowDetail.fromJson(responseJson);
    } else {
      throw Exception("Failed to load tv show detail.");
    }
  }
}
