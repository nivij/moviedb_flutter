// api_constants.dart

class ApiConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = "35f09c510c73e90c45fdefd02f9dd8ee";

  // Add more endpoints as needed
  static const String popularMoviesEndpoint = '/movie/popular';


  static Duration connectionTimeout = Duration(milliseconds: 1000);
  static Duration receiveTimeout = Duration(milliseconds: 1000);
}
