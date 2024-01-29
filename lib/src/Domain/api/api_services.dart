import 'package:dio/dio.dart';

import '../model/model.dart';
class Apiservices {
  final Dio dio = Dio();
  final String baseurl = 'https://api.themoviedb.org/3';
  final String apiKey = "35f09c510c73e90c45fdefd02f9dd8ee";

  Future<List<Movie>> getNowplayingMovies() async {
    try {
      final url = '$baseurl/movie/popular';
      print("API Call");
      final response = await dio.get(
        url,
        queryParameters: {'api_key': apiKey},
      );

      var movies = response.data['results'] as List;
      List<Movie> movieList = movies.map((json) => Movie.fromJson(json))
          .toList();
      print(movieList);
      return movieList;
    } catch (error, stacktrace) {
      print(error);
      throw Exception('Exception occurred: $error with stacktrace $stacktrace');
    }
  }
}