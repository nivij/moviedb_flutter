import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class My_List_Button extends StatelessWidget {
  const My_List_Button({Key? key, required this.icon, required this.title, this.IconSize=30, this.textSize=18})
      : super(key: key);
  final IconData icon;
  final String title;
  final double IconSize;
  final double textSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon,
            color: Colors.white,
            size: IconSize),
        Text(
          title,
          style: GoogleFonts.outfit(

            color: Colors.white,
            fontSize: textSize,),
        ),
      ],
    );
  }
}
