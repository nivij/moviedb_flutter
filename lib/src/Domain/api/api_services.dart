import 'package:dio/dio.dart';
import '../model/model.dart';
import 'repositories/apiUrlConst.dart';

class Apiservices {
  final Dio dio;

  // Constructor to initialize Dio with custom timeouts
  Apiservices() : dio = Dio(BaseOptions(
    connectTimeout: ApiConstants.connectionTimeout,
    receiveTimeout: ApiConstants.receiveTimeout,
  ));

  Future<List<Movie>> getNowplayingMovies() async {
    try {
      final url = '${ApiConstants.baseUrl}${ApiConstants.popularMoviesEndpoint}';
      print("API Call");

      final response = await dio.get(
        url,
        queryParameters: {'api_key': ApiConstants.apiKey},
      );

      var movies = response.data['results'] as List;
      List<Movie> movieList = movies.map((json) => Movie.fromJson(json)).toList();
      print(movieList);
      return movieList;
    } catch (error, stacktrace) {
      print(error);
      throw Exception('Exception occurred: $error with stacktrace $stacktrace');
    }
  }
}
