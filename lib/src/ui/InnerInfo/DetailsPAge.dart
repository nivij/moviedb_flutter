import 'package:codenoramovie/src/res/widgets/Appbar.dart';
import 'package:codenoramovie/src/res/widgets/cardloading.dart';
import 'package:codenoramovie/src/res/widgets/watchButton.dart';
import 'package:codenoramovie/src/ui/InnerInfo/widgets/ParagraphWithMoreButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../res/buttons/appbar.dart';
import '../../res/buttons/list_button.dart';
import '../../res/string/string.dart';
import '../home/widgets/trending_card.dart';

class DetailsPage extends HookWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final volumeOn = useState(false);

    return Scaffold(
      backgroundColor: Color(0xFF121318),
      appBar: CustomAppBar(title: 'CodeNora', actions: [
        constSearchIconButton(),
        kwidtht10,
        constProfileIconButton(),
        kwidtht10,
      ]),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  volumeOn.value = !volumeOn.value;
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      ShimmerLoadingWidget(
                        width: double.infinity,
                        height: 200,
                      ),
                      Positioned(
                        top: 50,
                        right: 20,
                        bottom: -80,
                        child: Icon(
                          volumeOn.value ? Icons.volume_up : Icons.volume_off,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              kheight10,
              Text(
                "MovieName",
                style: TextStyle(color: Colors.white),
              ),
              kheight10,
              Text(
                "Genre",
                style: TextStyle(color: Colors.white.withOpacity(0.5)),
              ),
              kheight10,
              WatchButton(
                onTap: () {},
              ),
            ],
          ),
        ),
        kheight10,
        Divider(
          height: 15,
          color: Colors.white.withOpacity(0.5),
          indent: 30.0,
          endIndent: 30.0,
        ),
        kheight10,
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Row(
            children: [
              My_List_Button(
                icon: Icons.thumb_up,
                title: '10k',
                IconSize: 23,
                textSize: 15,
              ),
              kwidtht10,
              My_List_Button(
                icon: Icons.thumb_down,
                title: '1',
                IconSize: 23,
                textSize: 15,
              ),
              kwidtht20,
              My_List_Button(
                icon: Icons.add_circle_outline,
                title: 'WatchList',
                IconSize: 23,
                textSize: 15,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: ParagraphWithMoreButton(
            text:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Related Movies",
              style: TextStyle(color: Colors.white),
            ),
            LimitedBox(
              maxHeight: 230,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                    7,
                        (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ShimmerLoadingWidget(
                            height: 200,
                            width: 150,
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
