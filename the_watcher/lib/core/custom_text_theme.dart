import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class CustomTextStyle {
  static TextStyle black({double? fontSize, FontWeight? fontWeight}) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: Colors.black,
    );
  }

  static TextStyle red({double? fontSize, FontWeight? fontWeight}) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: Colors.red,
    );
  }

  static TextStyle outlined(
      {required Color strokeColor,
      required Color textColor,
      double? radius,
      double? fontSize,
      FontWeight? fontWeight}) {
    return GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: textColor,
        shadows: [
          Shadow(
              // bottomLeft
              offset: const Offset(-1.5, -1.5),
              color: strokeColor,
              blurRadius: radius ?? 0),
          Shadow(
              // bottomRight
              offset: const Offset(1.5, -1.5),
              color: strokeColor,
              blurRadius: radius ?? 0),
          Shadow(
              // topRight
              offset: const Offset(1.5, 1.5),
              color: strokeColor,
              blurRadius: radius ?? 0),
          Shadow(
              // topLeft
              offset: const Offset(-1.5, 1.5),
              color: strokeColor,
              blurRadius: radius ?? 0),
        ]);
  }
}
