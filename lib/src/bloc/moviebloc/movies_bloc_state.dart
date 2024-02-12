import 'package:equatable/equatable.dart';

import '../../Domain/model/model.dart';

abstract class MovieState extends Equatable{
  const MovieState();

  @override
  List<Object> get props =>[];
}
class MovieLoading extends MovieState{}


class MovieLoaded extends MovieState {
  final List<Movie> NowplayingList;
  final List<Movie> PopularmoviesList;
  const MovieLoaded(this.NowplayingList, this.PopularmoviesList);
  @override
  List<Object> get props =>[ NowplayingList,PopularmoviesList];
}
class MovieError extends MovieState{}

