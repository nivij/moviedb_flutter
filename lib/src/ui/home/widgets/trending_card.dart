import 'package:codenoramovie/src/res/string/string.dart';
import 'package:flutter/cupertino.dart';

import '../../../bloc/moviebloc/movies_bloc_state.dart';
import '../../../res/images/assetsImage.dart';
import 'mainCard.dart';
import 'main_card.dart';

class main_title_card extends StatelessWidget {
  final String title;
  final MovieLoaded state;

  const main_title_card({Key? key, required this.title, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: main_title(titles: title),
        ),
        kheight10,
        LimitedBox(
          maxHeight: 230,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              1,
                  (index) => maincard(
                index: index,
                imageUrls: state.PopularmoviesList
                    .take(5)
                    .map((movie) => buildImageUrl(movie.backdropPath))
                    .toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
