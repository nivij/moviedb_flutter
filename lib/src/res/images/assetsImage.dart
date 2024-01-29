import 'package:flutter/cupertino.dart';

class FilmImage{

  String image;
  String text;
  String genre;
  FilmImage({required this.image,required this.text,required this.genre});

  factory FilmImage.fromJson(Map<String, dynamic> json) {
    return FilmImage(
        image: json['image'],
      text: json['text'],
      genre: json['genre'],


    );
  }

  Map<String, dynamic> toJson() {
    return {
     image:'image',
      text:'text',
      genre:'genre',
    };
  }
}

class Trending{

  String Trendimage;

  Trending({required this.Trendimage});
}



List<FilmImage> image=[
  FilmImage(image: 'assets/image/1.jpg', text: 'ewegwrg', genre: 'awgawgarg-agargarg-arga'),
  FilmImage(image: 'assets/image/2.jpg', text: 'sdvSDv', genre: 'agarg-argarg-rgarga-gar'),
  FilmImage(image: 'assets/image/3.jpg', text: 'rbtrr', genre: 'aga-gargarg-argarg-arg'),
  FilmImage(image: 'assets/image/4.jpg', text: 'efFEF', genre: 'fbafb-th-thhh'),
  FilmImage(image: 'assets/image/5.jpg', text: 'regrhe', genre: 'arharh-arhahtha-aha'),
  FilmImage(image: 'assets/image/6.jpg', text: 'efdsgs', genre: 'arhrh-arharha-harh'),


];
List<Trending> Trendimage=[
  Trending(Trendimage: 'assets/trending/1.jpg'),
  Trending(Trendimage: 'assets/trending/10.jpg'),
  Trending(Trendimage: 'assets/trending/14.jpg'),
  Trending(Trendimage: 'assets/trending/12.jpg'),
  Trending(Trendimage: 'assets/trending/13.jpg'),


];