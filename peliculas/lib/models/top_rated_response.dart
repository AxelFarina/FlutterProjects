// To parse this JSON data, do
//
//     final topRatedResponse = topRatedResponseFromMap(jsonString);

import 'dart:convert';

import 'package:peliculas/models/models.dart';

class TopRatedResponse {
  TopRatedResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory TopRatedResponse.fromJson(String str) => TopRatedResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TopRatedResponse.fromMap(Map<String, dynamic> json) => TopRatedResponse(
    page: json["page"],
    results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toMap() => {
    "page": page,
    "results": List<dynamic>.from(results.map((x) => x.toMap())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}