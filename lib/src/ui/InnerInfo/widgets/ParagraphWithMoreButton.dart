import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:codenoramovie/src/res/string/string.dart';

class ParagraphWithMoreButton extends HookWidget {
  final String text;
  final int maxLines;

  const ParagraphWithMoreButton({required this.text, this.maxLines = 2});

  @override
  Widget build(BuildContext context) {


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(color: Colors.white),
          maxLines:  maxLines,
          overflow: TextOverflow.ellipsis,
        ),
        // Arbitrary check for "more" button
          GestureDetector(
            onTap: () {

              _showFullText(context);
            },
            child: Text(
              'More',
              style: TextStyle(color: Color(0xFFDCFC35), fontWeight: FontWeight.bold),
            ),
          ),
      ],
    );
  }

  void _showFullText(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.black87,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20),
                LimitedBox(
                  maxHeight: 180,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      7,
                          (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CircleAvatar(backgroundColor: Colors.grey, radius: 50),
                            SizedBox(height: 10),
                            Text("Cast", style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Close'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
