import 'package:codenoramovie/src/ui/home/widgets/trending_card.dart';
import 'package:flutter/material.dart';
import 'package:codenoramovie/src/bloc/moviebloc/movies_bloc_state.dart';
import 'package:codenoramovie/src/ui/home/widgets/carouselSlider.dart';
import 'package:codenoramovie/src/res/images/assetsImage.dart';
import 'package:codenoramovie/src/res/widgets/watchButton.dart';
import '../../../res/buttons/list_button.dart';
import '../../../res/string/string.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../res/widgets/videoPlayer.dart';
Widget buildMovieLoadedUI(BuildContext context, MovieLoaded state, int currentIndex, Function(int) onImageChanged) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarosuelSliderWidget(
          imageUrls: state.NowplayingList
              .map((movie) => buildImageUrl(movie.backdropPath))
              .toList(),
          onImageChanged: onImageChanged,
        ),
        SizedBox(height: 20),
        Text(
          state.NowplayingList[currentIndex].originalTitle,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 10),
        Text(
          state.NowplayingList[currentIndex].title,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FullScreenVideoPlayer(
                      videoUrl: 'https://www.youtube.com/watch?v=scJy6gA230s',
                    ),
                  ),
                );
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
        main_title_card(title: "Now Playing",state: state,),
        SizedBox(height: 20),
        main_title_card(title: "Released in the past year",state: state,),
        SizedBox(height: 20),
      ],
    ),
  );
}
