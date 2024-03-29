import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fonts {
  Fonts._();

  static normalText(String text,
          {TextStyle? style,
          Color? color,
          double size = 14,
          TextDecoration? underline,
          FontWeight fontWeight = FontWeight.w700,
          TextAlign? textAlign}) =>
      Text(
        text,
        style: style ??
            GoogleFonts.montserrat(
              fontWeight: fontWeight,
              color: color,
              fontSize: size,
              decoration: underline,
            ),
        textAlign: textAlign,
      );

  static normalLightText(String text,
          {TextStyle? style,
          Color? color,
          double size = 14,
          TextDecoration? underline}) =>
      Text(text,
          style: style ??
              GoogleFonts.montserrat(
                fontWeight: FontWeight.w200,
                color: color,
                fontSize: size,
                decoration: underline,
              ));
  static normalMediumText(
    String text, {
    TextStyle? style,
    Color? color,
    double size = 16,
    TextDecoration? underline,
    FontStyle? fontStyle,
  }) =>
      Text(
        text,
        style: style ??
            GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              fontStyle: fontStyle,
              color: color,
              fontSize: size,
              decoration: underline,
            ),
      );
  static boldText(String text,
          {TextStyle? style,
          Color? color,
          double? size,
          TextDecoration? underline}) =>
      Text(text,
          style: style ??
              GoogleFonts.montserrat(
                fontWeight: FontWeight.w700,
                color: color,
                fontSize: size,
                decoration: underline,
              ));
}
