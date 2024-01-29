import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class main_title extends StatelessWidget {
  const main_title({Key? key, required this.titles}) : super(key: key);
  final String titles;
  @override
  Widget build(BuildContext context) {
    return Text(
      titles,
      style: GoogleFonts.outfit(fontSize: 16,color: Colors.white),
    );
  }
}
