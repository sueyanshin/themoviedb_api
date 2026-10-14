import 'package:flutter/material.dart';
import 'package:test_app/models/tv_show.dart';
import 'package:test_app/models/tv_show_detail.dart';
import 'package:test_app/services/api_service.dart';

class TvShowsProvider extends ChangeNotifier {
  late List<TvShow> _tvShows;
  bool _isTvShowsLoading = false;
  String _tvShowsErrorMessage = "";

  TvShowDetail _tvShowDetail = TvShowDetail();
  bool _isDetailLoading = false;
  String _detailErrorMessage = "";

  final ApiService _apiService = ApiService();

  bool get isTvShowsLoading => _isTvShowsLoading;
  String get tvShowsErrorMessage => _tvShowsErrorMessage;
  List<TvShow> get tvShows => _tvShows;

  TvShowDetail get tvShowDetail => _tvShowDetail;
  bool get isDetailLoading => _isDetailLoading;
  String get detailErrorMessage => _detailErrorMessage;

  TvShowsProvider() {
    fetchPopularSeries();
  }

  Future<void> fetchPopularSeries() async {
    try {
      _isTvShowsLoading = true;
      _tvShowsErrorMessage = "";
      notifyListeners();
      _tvShows = await _apiService.fetchPopularSeries();
    } catch (e) {
      _tvShowsErrorMessage = e.toString();
    } finally {
      _isTvShowsLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchTvShowDetail(int id) async {
    try {
      _isDetailLoading = true;
      _detailErrorMessage = "";
      notifyListeners();
      _tvShowDetail = await _apiService.fetchTvShowDetail(id);
    } catch (e) {
      _detailErrorMessage = e.toString();
    } finally {
      _isDetailLoading = false;
      notifyListeners();
    }
  }
}
