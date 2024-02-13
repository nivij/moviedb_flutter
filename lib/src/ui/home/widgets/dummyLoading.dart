import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:codenoramovie/src/res/string/string.dart';
import 'package:codenoramovie/src/ui/home/widgets/trending_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../res/buttons/list_button.dart';
import '../../../res/widgets/cardloading.dart';
import '../../../res/widgets/watchButton.dart';

class DummyLoading extends StatelessWidget {
  const DummyLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.11),
                  spreadRadius: 1,
                  blurRadius: 3,
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
              ),
              items: [
                Container(
                  width: double.infinity,
                  child:ShimmerLoadingWidget()
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
         ShimmerLoadingWidget(height: 20, width: 25),
          SizedBox(height: 10),
          ShimmerLoadingWidget(height: 15, width: 40),
      
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
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left:15.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: ShimmerLoadingWidget(height: 15,width: 50,)),
          ),
          kheight20,
          SizedBox(height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(10),
              itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ShimmerLoadingWidget(width: 130,height: 250,),
                  );
                }),
          ),
          // main_title_card(title: "Now Playing",state: state,),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left:15.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: ShimmerLoadingWidget(height: 15,width: 50,)),
          ),
          SizedBox(height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(10),
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ShimmerLoadingWidget(width:  130,height: 250,),
                  );
                }),
          ),
          // main_title_card(title: "Released in the past year",state: state,),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
