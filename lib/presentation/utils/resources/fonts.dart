import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fonts {
  Fonts._();

  static normalText(String text,
          {TextStyle? style,
          Color? color,
          double size = 14,
          TextDecoration? underline}) =>
      Text(text,
          style: style ??
              GoogleFonts.montserrat(
                fontWeight: FontWeight.w400,
                color: color,
                fontSize: size,
                decoration: underline,
              ));
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
  static normalMediumText(String text,
          {TextStyle? style,
          Color? color,
          double size = 16,
          TextDecoration? underline}) =>
      Text(text,
          style: style ??
              GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                color: color,
                fontSize: size,
                decoration: underline,
              ));
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
