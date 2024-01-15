import 'package:flutter/material.dart';

class FontConstants {
  static const String fontFamily = "fira code";
}

class fontWeightManager {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

class Fontsize {
  static const double s8 = 12;

  static const double s12 = 14;

  static const double s14 = 16;
  static const double s16 = 18;
  static const double s18 = 20;
  static const double s20 = 22;

  static const double s22 = 24;
}

TextStyle _getTextStyle(
  Color color, {
  required double fontsize,
  required FontWeight fontWeight,
}) {
  return TextStyle(
    fontFamily: FontConstants.fontFamily,
    fontSize: fontsize,
    color: color,
    fontWeight: fontWeight,
  );
}

TextStyle getRegulerTextStyle(
  Color color, {
  double fontSize = Fontsize.s14,
}) {
  return _getTextStyle(color,
      fontsize: fontSize, fontWeight: fontWeightManager.regular);
}

TextStyle getMediumTextStyle(
  Color color, {
  double fontSize = Fontsize.s18,
}) {
  return _getTextStyle(color,
      fontsize: fontSize, fontWeight: fontWeightManager.medium);
}

TextStyle getLightTextStyle(
  Color color, {
  double fontSize = Fontsize.s14,
}) {
  return _getTextStyle(color,
      fontsize: fontSize, fontWeight: fontWeightManager.light);
}

TextStyle getBoldTextStyle(
  Color color, {
  double fontSize = Fontsize.s22,
}) {
  return _getTextStyle(
    color,
    fontsize: fontSize,
    fontWeight: fontWeightManager.bold,
  );
}
