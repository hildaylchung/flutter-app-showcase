// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle pageTitle = GoogleFonts.hind(
      fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black);

  static TextStyle twoLineTitle = GoogleFonts.hind(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black);

  static TextStyle title = GoogleFonts.hind(
      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black);

  static TextStyle titleTight = GoogleFonts.hind(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)
      .copyWith(height: 1.1);

  static TextStyle body = GoogleFonts.hind(
      fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black45);

  static TextStyle bodyTight = GoogleFonts.hind(
          fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black45)
      .copyWith(height: 1.1);

  static TextStyle bodyDarker = GoogleFonts.hind(
          fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black87)
      .copyWith(height: 1.1);

  static TextStyle emphasizedNumber = GoogleFonts.hind(
      fontSize: 36, fontWeight: FontWeight.w800, color: Colors.black);

  static TextStyle strong = GoogleFonts.hind(
      fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black54);
}
