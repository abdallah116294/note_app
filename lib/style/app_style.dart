import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color mainColor = const Color(0xff0f222d);
  static Color accentColor = const Color(0xff0065ff);
  //colors for cards

  static List<Color> cardSColor = [
    Colors.white,
    Colors.red.shade100,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.blue.shade100,
    Colors.blueGrey.shade100,
  ];
  //style for the text
  static TextStyle mainTitle = GoogleFonts.roboto(
     fontSize: 25,fontWeight:FontWeight.bold
  );
    static TextStyle mainContent = GoogleFonts.nunito(
     fontSize: 20,fontWeight:FontWeight.normal
  );
    static TextStyle datatTitle = GoogleFonts.roboto(
     fontSize: 10,fontWeight:FontWeight.w500,color: Colors.black
  );
}
