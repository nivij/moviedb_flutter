import 'package:codenoramovie/src/ui/home/widgets/homePageLoadedUI.dart';
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
      return () {
        // Clean up
      };
    }, []);

    final currentIndex = useState<int>(0);

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
          print("State: $state"); // Add this line for debugging
          if (state is MovieLoaded) {
            return buildMovieLoadedUI(context, state, currentIndex.value, (index) {
              currentIndex.value = index;
            });
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
}
