import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../res/widgets/cardloading.dart';

class CarosuelSliderWidget extends StatelessWidget {
  final List<String> imageUrls;
  final Function(int)? onImageChanged;

  const CarosuelSliderWidget({
    Key? key,
    required this.imageUrls,
    this.onImageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.11),
            spreadRadius: 1,
            blurRadius: 340,
            offset: Offset(10, 40),
          ),
        ],
      ),
      child: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 0.5,
          height: 330,
          aspectRatio: 2.0,

          enlargeCenterPage: true,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5),
          onPageChanged: (index, reason) {
            print("Current Index: $index");
            onImageChanged?.call(index);
          },
        ),
        items: (imageUrls ?? []).map((imageUrl) {
          return Container(
            width: double.infinity,
            child: CachedNetworkImage(

              imageUrl:  imageUrl,
              fit: BoxFit.fitHeight,

              placeholder: (context, url) => ShimmerLoadingWidget(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          );
        }).toList(),
      ),
    );
  }
}
