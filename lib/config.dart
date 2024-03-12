// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle pageTitle = GoogleFonts.roboto(
      fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black);

  static TextStyle twoLineTitle = GoogleFonts.roboto(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black);

  static TextStyle title = GoogleFonts.roboto(
      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black);

  static TextStyle titleTight = GoogleFonts.roboto(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)
      .copyWith(height: 1.1);

  static TextStyle body = GoogleFonts.roboto(
      fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black45);

  static TextStyle bodyTight = GoogleFonts.roboto(
          fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black45)
      .copyWith(height: 1.1);

  static TextStyle strong = GoogleFonts.roboto(
      fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black54);
}
