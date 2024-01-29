import 'package:equatable/equatable.dart';

import '../../Domain/model/model.dart';

abstract class MovieState extends Equatable{
  const MovieState();

  @override
  List<Object> get props =>[];
}
class MovieLoading extends MovieState{}


class MovieLoaded extends MovieState {
  final List<Movie> movielist;
  const MovieLoaded(this.movielist);
  @override
  List<Object> get props =>[ movielist];
}
class MovieError extends MovieState{}

