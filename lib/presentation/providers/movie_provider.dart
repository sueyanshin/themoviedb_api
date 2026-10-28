import 'package:flutter/material.dart';
import 'package:test_app/models/cast_detail.dart';
import 'package:test_app/models/movie.dart';
import 'package:test_app/models/movie_detail.dart';
import 'package:test_app/services/api_service.dart';

class MovieProvider extends ChangeNotifier {
  List<Movie> _popularMovies = [];
  bool _isPopularMovieLoading = false;
  String _popularMoviesErrorMessage = "";

  MovieDetail _movieDetail = MovieDetail();
  bool _isMovieDetailLoading = false;
  String _movieDetailErrorMessage = "";

  CastDetail _castDetail = CastDetail();
  bool _isCastDetailLoading = false;
  String _castDetailErrorMessage = "";

  bool _isTextExpanded = false;

  final ApiService _apiService = ApiService();

  bool get isPopularMovieLoading => _isPopularMovieLoading;
  String get popularMoviesErrorMessage => _popularMoviesErrorMessage;
  List<Movie> get popularMovies => _popularMovies;

  MovieDetail get movieDetail => _movieDetail;
  bool get isMovieDetailLoading => _isMovieDetailLoading;
  String get movieDetailErrorMessage => _movieDetailErrorMessage;

  CastDetail get castDetail => _castDetail;
  bool get isCastDetailLoading => _isCastDetailLoading;
  String get castDetailErrorMessage => _castDetailErrorMessage;

  bool get isTextExpanded => _isTextExpanded;

  Future<void> fetchPopularMovies() async {
    try {
      _isPopularMovieLoading = true;
      _popularMoviesErrorMessage = "";
      notifyListeners();
      _popularMovies = await _apiService.fetchPopularMovies();
    } catch (e) {
      _popularMoviesErrorMessage = e.toString();
    } finally {
      _isPopularMovieLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchMovieDetail(int id) async {
    try {
      _isMovieDetailLoading = true;
      _movieDetailErrorMessage = "";
      notifyListeners();
      _movieDetail = await _apiService.fetchMovieDetail(id);
    } catch (e) {
      _movieDetailErrorMessage = e.toString();
    } finally {
      _isMovieDetailLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchCastDetail(int id) async {
    try {
      _isCastDetailLoading = true;
      _castDetailErrorMessage = "";
      notifyListeners();
      _castDetail = await _apiService.fetchCastDetail(id);
    } catch (e) {
      _castDetailErrorMessage = e.toString();
    } finally {
      _isCastDetailLoading = false;
      notifyListeners();
    }
  }

  void updateExpanded(bool value) {
    _isTextExpanded = value;
    notifyListeners();
  }
}
