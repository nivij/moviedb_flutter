import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:google_fonts/google_fonts.dart';

import '../string/string.dart';

class WatchButton extends StatelessWidget {
  final VoidCallback onTap;

  const WatchButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bounceable(

      onTap: onTap,
      child: Container(
        height: 50,
        width: 190,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color:Color(0xFFDCFC35),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            kwidtht10,
            Icon(Icons.play_circle, color: Colors.black,),
            kwidtht10,
            Text("Watch", style: GoogleFonts.poppins(color: Colors.black, fontSize: 17),),
            kwidtht10,
          ],
        ),
      ),
    );
  }
}
