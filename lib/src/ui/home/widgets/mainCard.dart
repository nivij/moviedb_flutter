import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../res/widgets/cardloading.dart';
import '../../InnerInfo/DetailsPAge.dart';

class maincard extends StatelessWidget {
  const maincard({Key? key, required this.index, required this.imageUrls}) : super(key: key);

  final int index;
  final List<String> imageUrls;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(DetailsPage());
      },
      child: Row(
        children: imageUrls.map((url) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 220,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: CachedNetworkImage(

              // useOldImageOnUrlChange: true,
              imageUrl: url,
              fit: BoxFit.cover,
              placeholder: (context, url) => Center(child: ShimmerLoadingWidget(width: 150,height: 220,)), // Placeholder widget while loading
              errorWidget: (context, url, error) => Icon(Icons.error), // Error widget when image fails to load
            ),
          );
        }).toList(),
      ),
    );
  }
}
