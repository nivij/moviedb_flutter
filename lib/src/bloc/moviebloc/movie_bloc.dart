// movie_bloc.dart

import 'package:bloc/bloc.dart';
import 'package:codenoramovie/src/Domain/api/api_services.dart';
import 'package:codenoramovie/src/Domain/model/model.dart';
import 'package:codenoramovie/src/bloc/moviebloc/movie_bloc_event.dart';
import 'package:codenoramovie/src/bloc/moviebloc/movies_bloc_state.dart';
class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final Apiservices service = Apiservices();

  MovieBloc() : super(MovieLoading());

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is MovieEventStarted) {
      yield* _mapMovieEventStartedToState(event.movieId, event.query);
    }
  }

  Stream<MovieState> _mapMovieEventStartedToState(
      int movieId, String query) async* {
    yield MovieLoading();

    try {
      List<Movie> movielist = await service.getNowplayingMovies();
      yield MovieLoaded(movielist);
    } on Exception catch (e) {
      yield MovieError();
    }
  }
}
