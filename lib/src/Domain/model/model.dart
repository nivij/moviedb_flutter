// import 'package:json_annotation/json_annotation.dart';
class Movie {
  final String backdropPath;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overView;
  final String posterPath;
  final double popularity;
  final String title;
  final bool video;
  final int voteCount;
  final dynamic voteAverage;

  // Nullable error field
  String? error;

  Movie({
    required this.backdropPath,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overView,
    required this.posterPath,
    required this.popularity,
    required this.title,
    required this.video,
    required this.voteCount,
    required this.voteAverage,
  });

  // Factory method to create a Movie instance from a JSON map
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      backdropPath: json['backdrop_path'] as String,
      id: json['id'] as int,
      originalLanguage: json['original_language'] as String,
      originalTitle: json['original_title'] as String,
      overView: json['overview'] as String,
      posterPath: json['poster_path'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      title: json['title'] as String,
      video: json['video'] as bool,
      voteCount: json['vote_count'] as int,
      voteAverage: json['vote_average']
    );
  }

  // Method to convert Movie instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'backdrop_path': backdropPath,
      'id': id,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overView,
      'poster_path': posterPath,
      'popularity': popularity,
      'title': title,
      'video': video,
      'vote_count': voteCount,
      'vote_average': voteAverage,
      'error': error,
    };
  }
}
