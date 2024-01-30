import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kheight20=SizedBox(height: 20,);
const kheight10=SizedBox(height: 10,);
const kwidtht20=SizedBox(width: 20,);
const kwidtht10=SizedBox(width: 10,);



class AppBarString{
  static  TextStyle titleStyle=TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,

    fontFamily: GoogleFonts.poppins().fontFamily,

  );  static  TextStyle subtitleStyle=TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: GoogleFonts.poppins().fontFamily,

  );
}

String buildImageUrl(String path) {
  return 'https://image.tmdb.org/t/p/original/$path';
}