import 'package:codenoramovie/src/res/images/assetsImage.dart';
import 'package:codenoramovie/src/res/string/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class maincard extends StatelessWidget {
  const maincard({Key? key, required this.index, required this.filmImage}) : super(key: key);
  final int index;
  final FilmImage filmImage;
  @override
  Widget build(BuildContext context) {
    return
     Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 220,
            width: 150,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image:  AssetImage(filmImage.image))
            ),

          ),


        ],

    );
  }
}
