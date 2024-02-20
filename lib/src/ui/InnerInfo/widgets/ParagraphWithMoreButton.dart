import 'package:codenoramovie/src/res/string/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ParagraphWithMoreButton extends StatefulWidget {
  final String text;
  final int maxLines;

  const ParagraphWithMoreButton({required this.text, this.maxLines = 2});

  @override
  _ParagraphWithMoreButtonState createState() => _ParagraphWithMoreButtonState();
}

class _ParagraphWithMoreButtonState extends State<ParagraphWithMoreButton> {
  bool _showMore = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: TextStyle(color: Colors.white),
          maxLines: _showMore ? null : widget.maxLines,
          overflow: TextOverflow.ellipsis,
        ),
        if (!_showMore && widget.text.length > widget.maxLines * 50) // Arbitrary check for "more" button
          GestureDetector(
            onTap: () {

              _showFullText(context); // Call function to show full text
            },
            child: Text(
              'More',
              style: TextStyle(color: Colors.white.withOpacity(0.4), fontWeight: FontWeight.bold),
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
                  widget.text,
                  style: TextStyle(color: Colors.white),
                ),
               kheight20,
                LimitedBox(
                  maxHeight: 180,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      7,
                          (index) =>Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                CircleAvatar(backgroundColor: Colors.grey,radius: 50),
                                kheight10,
                                Text("Cast",style: TextStyle(color: Colors.white),),
                              ],
                            ),
                          )
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
