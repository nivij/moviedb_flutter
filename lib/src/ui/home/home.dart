import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:codenoramovie/src/bloc/moviebloc/movie_bloc.dart';
import 'package:codenoramovie/src/bloc/moviebloc/movie_bloc_event.dart';
import 'package:codenoramovie/src/bloc/moviebloc/movies_bloc_state.dart';
import 'package:codenoramovie/src/res/images/assetsImage.dart';
import 'package:codenoramovie/src/res/widgets/watchButton.dart';
import 'package:codenoramovie/src/ui/home/widgets/carouselSlider.dart';
import 'package:codenoramovie/src/ui/home/widgets/dummyLoading.dart';
import 'package:codenoramovie/src/ui/home/widgets/trending_card.dart';

import '../../res/buttons/appbar.dart';
import '../../res/buttons/list_button.dart';
import '../../res/string/string.dart';


class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final movieBloc = BlocProvider.of<MovieBloc>(context);

    useEffect(() {
      movieBloc.add(MovieEventStarted(0, ""));
    }, []);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF121318),
        title: Text('CodeNora', style: AppBarString.titleStyle),
        actions: [
          constSearchIconButton(),
          kwidtht10,
          constProfileIconButton(),
          kwidtht10,
        ],
      ),
      backgroundColor: Color(0xFF121318),
      body: BlocBuilder<MovieBloc, MovieState>(
        bloc: movieBloc,
        builder: (context, state) {
          if (state is MovieLoaded) {
            return _buildMovieLoadedUI(context, state);
          } else if (state is MovieLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MovieError) {
            return Text('Error fetching movies');
          } else {
            return Text('Unknown state');
          }
        },
      ),
    );
  }

  Widget _buildMovieLoadedUI(BuildContext context, MovieLoaded state) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CarosuelSliderWidget(
            imageUrls: state.movielist
                .map((movie) => buildImageUrl(movie.backdropPath))
                .toList(),
            onImageChanged: (index) {
              print("Index changed: $index");
            },
          ),
          SizedBox(height: 20),
          Text(
            state.movielist[0].originalTitle,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 10),
          Text(
            state.movielist[0].title,
            style: TextStyle(color: Colors.white.withOpacity(0.6)),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: My_List_Button(
                  icon: Icons.info_outline,
                  title: 'Details',
                  IconSize: 23,
                  textSize: 15,
                ),
              ),
              WatchButton(
                onTap: () {
                  print("Watch button tapped!");
                },
              ),
              Expanded(
                child: My_List_Button(
                  icon: Icons.bookmark,
                  title: 'watchList',
                  IconSize: 23,
                  textSize: 15,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          main_title_card(title: "Now Playing"),
          SizedBox(height: 20),
          main_title_card(title: "Released in the past year"),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
