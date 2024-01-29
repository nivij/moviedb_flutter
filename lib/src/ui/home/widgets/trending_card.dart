import 'package:codenoramovie/src/res/string/string.dart';
import 'package:flutter/cupertino.dart';

import '../../../res/images/assetsImage.dart';
import 'mainCard.dart';
import 'main_card.dart';


class main_title_card extends StatelessWidget {
  final String title;
  const main_title_card({Key? key, required this.title}) : super(key: key);

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
          maxHeight: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children:
            List.generate(
                image.length,
                    (index) => maincard(index:index, filmImage: image[index],)),

          ),
        ),
      ],
    );
  }
}
