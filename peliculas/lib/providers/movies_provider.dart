import 'dart:async';
import 'dart:convert' as convert;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/helpers/debouncer.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/models/search_response.dart';
import 'package:http/retry.dart';

import '../models/upcoming_response.dart';

class MoviesProvider with ChangeNotifier {
  final _apiKey = 'ec4ff1b6182572d3e74735e74ca3a8ef';
  final _baseUrl = 'api.themoviedb.org';
  final _language = 'es-ES';
  bool _isConnected = false;

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  List<Movie> topRatedMovies = [];
  List<Movie> upComingMovies = [];
  List<Result> videoMovies = [];

  Map<int, List<Cast>> moviesCast = {};

  int _popularPage = 0;
  int _ratedPage = 0;
  int _displayMovies = 0;
  int _upcomingPage = 0;

  final debouncer = Debouncer(
    duration: Duration(milliseconds: 0),
  );

  final StreamController<List<Movie>> _suggestionStreamController =
      StreamController.broadcast();

  Stream<List<Movie>> get suggestionStream =>
      _suggestionStreamController.stream;

  MoviesProvider() {
    //getOnDisplayMovies();
    //getPopularMovies();
    //getTopRatedMovies();
  }

  Future<String> _getJsonData(String endPoint, [int? page = 1]) async {
    while (!_isConnected) {
      _isConnected = await isConnected();
    }
    final url = Uri.https(_baseUrl, endPoint,
        {'api_key': _apiKey, 'language': _language, 'page': '$page'});
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    _displayMovies++;
    final jsonData = await _getJsonData('3/movie/now_playing', _displayMovies);
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    onDisplayMovies += nowPlayingResponse.results;

    notifyListeners();
  }

  getPopularMovies() async {
    _popularPage++;
    final jsonData = await _getJsonData('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);
    popularMovies = [...popularMovies, ...popularResponse.results];

    notifyListeners();
  }

  getUpcomingMovies() async {
    _upcomingPage++;
    final jsonData = await _getJsonData('3/movie/upcoming', _upcomingPage);
    final upcomingResponse = UpcomingResponse.fromJson(jsonData);
    upComingMovies = [...upComingMovies, ...upcomingResponse.results];

    notifyListeners();
  }

  getTopRatedMovies() async {
    _ratedPage++;
    final jsonData = await _getJsonData('3/movie/top_rated', _ratedPage);
    final topRatedResponse = TopRatedResponse.fromJson(jsonData);
    topRatedMovies = [...topRatedMovies, ...topRatedResponse.results];

    notifyListeners();
  }

  Future<List<Result>> getVideoMovies(int idMovie) async {
    final jsonData = await _getJsonData('3/movie/$idMovie/videos');
    final videoResponse = VideoResponse.fromJson(jsonData);
    //videoMovies = videoResponse.results;
    return videoResponse.results;
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    //TODO: Revisar el mapa
    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;

    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);

    moviesCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;
  }

  Future<List<Movie>> searchMovies(String query) async {
    final url = Uri.https(_baseUrl, '3/search/movie',
        {'api_key': _apiKey, 'language': 'es-ES', 'query': query});

    final response = await http.get(url);
    final searchResponse = SearchResponse.fromJson(response.body);

    return searchResponse.results;
  }

  void getSuggestionByQuery(String searchTerm) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      final results = await searchMovies(value);
      _suggestionStreamController.add(results);
    };

    //final timer = Timer.periodic(Duration(milliseconds: 300), (_) {});
    debouncer.value = searchTerm;

    //Future.delayed(Duration(milliseconds: 301)).then((_) => timer.cancel());
  }

  Future<bool> isConnected() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (_) {
      return false;
    }
  }

  Future<void> tryAgain() async {
    final client = RetryClient(peticiones());
    try {
      await client.read(Uri.parse('example.com'));
    } finally {
      notifyListeners();
      client.close();
    }
  }

  peticiones() async {
    getOnDisplayMovies();
    getTopRatedMovies();
    getPopularMovies();
    getUpcomingMovies();
  }
}
