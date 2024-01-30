

import 'package:codenoramovie/src/bloc/moviebloc/movie_bloc.dart';
import 'package:codenoramovie/src/bloc/moviebloc/movie_bloc_event.dart';
import 'package:codenoramovie/src/bloc/moviebloc/movies_bloc_state.dart';
import 'package:codenoramovie/src/res/images/assetsImage.dart';
import 'package:codenoramovie/src/res/widgets/watchButton.dart';
import 'package:codenoramovie/src/ui/home/widgets/carouselSlider.dart';
import 'package:codenoramovie/src/ui/home/widgets/trending_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../res/buttons/appbar.dart';
import '../../res/buttons/list_button.dart';
import '../../res/string/string.dart';
import '../../res/widgets/cardloading.dart';

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final currentImageIndex = useState(0);
    final movieBloc = BlocProvider.of<MovieBloc>(context);
    final state = BlocProvider.of<MovieBloc>(context).state;
    final isLoading = state is MovieLoading;

    useEffect(() {
      movieBloc.add(MovieEventStarted(0, ""));
    }, []);

    void handleWatchButtonTap() {
      // Your logic for the Watch button tap
      print("Watch button tapped!");
    }
    Widget getMovieText(int index, bool isLoading) {
      if (state is MovieLoaded && index >= 0 && index < state.movielist.length) {
        print(state.movielist[index].title);
        return Text(
          state.movielist[index].originalTitle,
          style: GoogleFonts.outfit(color: Colors.white),
        );
      }
      return isLoading ? ShimmerLoadingWidget(width: 90,height: 20,) : Text('');
    }


    Widget getMovieGenre(int index,bool isLoading) {
      if (state is MovieLoaded && index >= 0 &&
          index < state.movielist.length) {
        return Text(
          state.movielist[index].title,
          style: GoogleFonts.outfit(color: Colors.white.withOpacity(0.6)),
        )
        ;
      }
      return isLoading ? ShimmerLoadingWidget(width: 70, height: 20,) : Text('');
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF121318),
        title: Text('CodeNora', style: AppBarString.titleStyle),
        actions: [
          constSearchIconButton(),
          kwidtht10,
          constProfileIconButton(),
          kwidtht10
        ],
      ),
      backgroundColor: Color(0xFF121318),
      body:
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            BlocBuilder<MovieBloc, MovieState>(
              builder: (context, state) {
                if (state is MovieLoaded) {
                  return  CarosuelSliderWidget(
                    imageUrls: state.movielist
                        .map((movie) => buildImageUrl(movie.backdropPath))
                        .toList(),
                    onImageChanged: (index) {
                      print("Index changed: $index");
                      print("Image list length: ${image.length}");
                      if (index >= 0 && index < state.movielist.length) {
                        currentImageIndex.value = index;
                      }
                    },
                  );


                } else if (state is MovieLoading) {
                  return CircularProgressIndicator();
                } else if (state is MovieError) {
                  return Text('Error fetching movies');
                } else {
                  return Text('Unknown state');
                }
              },
            ),

            // CarosuelSliderWidget(
            //   onImageChanged: (index) {
            //     currentImageIndex.value = index;
            //   },
            // ),
            kheight20,
            getMovieText(currentImageIndex.value, isLoading),
            kheight10,
           getMovieGenre(currentImageIndex.value, isLoading),
            kheight20,
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
                WatchButton(onTap: handleWatchButtonTap),
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
            kheight20,
            main_title_card(title: "Now Playing"),
            kheight20,
            main_title_card(title: "Released in the past year"),
            kheight20,
          ],
        ),
      ),
    );
  }


}
