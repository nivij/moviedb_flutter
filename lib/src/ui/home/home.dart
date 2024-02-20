import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:codenoramovie/src/bloc/moviebloc/movie_bloc.dart';
import 'package:codenoramovie/src/bloc/moviebloc/movie_bloc_event.dart';
import 'package:codenoramovie/src/bloc/moviebloc/movies_bloc_state.dart';

import 'package:codenoramovie/src/ui/home/widgets/homePageLoadedUI.dart';
import 'package:codenoramovie/src/ui/home/widgets/dummyLoading.dart';
import '../../res/buttons/appbar.dart';
import '../../res/buttons/list_button.dart';
import '../../res/string/string.dart';
import '../../res/widgets/Appbar.dart';

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final movieBloc = BlocProvider.of<MovieBloc>(context);
    if (movieBloc.state is! MovieLoaded) {
      movieBloc.add(MovieEventStarted(0, ""));
    }

    final currentIndex = useState<int>(0);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'CodeNora',
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
          print("State: $state"); // Add this line for debugging
          if (state is MovieLoaded) {
            return buildMovieLoadedUI(context, state, currentIndex.value, (index) {
              currentIndex.value = index;
            });
          } else if (state is MovieLoading) {
            return DummyLoading();
          } else if (state is MovieError) {
            // Show dummy loading for 10 seconds before showing popup
            Future.delayed(Duration(seconds: 5), () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(

                    title: Text("Network Error"),
                    content: Text("Error fetching movies. Please check your network connection."),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          movieBloc.add(MovieEventStarted(0, ""));
                        },
                        child: Text("OK"),
                      ),
                    ],
                  );
                },
              );
            });
            return DummyLoading();
          } else {
            return Text('Unknown state');
          }
        },
      ),
    );
  }
}
