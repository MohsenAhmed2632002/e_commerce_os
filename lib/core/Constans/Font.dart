import 'package:flutter/material.dart';

class FontConstants {
  static const String fontFamily = "Montserrat";
}

class fontWeightManager {
  static const FontWeight light = FontWeight.w500;
  static const FontWeight regular = FontWeight.w600;
  static const FontWeight medium = FontWeight.w700;
  static const FontWeight semiBold = FontWeight.w800;
  static const FontWeight bold = FontWeight.w900;
}

class Fontsize {
  static const double s10 = 10;
  static const double s12 = 13;
  static const double s14 = 15;
  static const double s16 = 17;
  static const double s18 = 18;
  static const double s20 = 19;
  static const double s22 = 20;
}

double theResponsiveFontSize(
    {required BuildContext context, required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;
  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.1;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < 600) {
    return width / 400;
  } else if (width < 900) {
    return width / 700;
  } else {
    return width / 1000;
  }
}

TextStyle _getTextStyle(Color color,
    {required double fontsize,
    required FontWeight fontWeight,
    required BuildContext context}) {
  return TextStyle(
    fontFamily: FontConstants.fontFamily,
    fontSize: theResponsiveFontSize(
      fontSize: fontsize,
      context: context,
    ),
    color: color,
    fontWeight: fontWeight,
  );
}

TextStyle getRegulerTextStyle(Color color,
    {double fontSize = Fontsize.s14, required BuildContext context}) {
  return _getTextStyle(color,
      fontsize: fontSize,
      fontWeight: fontWeightManager.regular,
      context: context);
}

TextStyle getMediumTextStyle(Color color,
    {double fontSize = Fontsize.s14, required BuildContext context}) {
  return _getTextStyle(color,
      fontsize: fontSize,
      fontWeight: fontWeightManager.medium,
      context: context);
}

TextStyle getLightTextStyle(Color color,
    {double fontSize = Fontsize.s14, required BuildContext context}) {
  return _getTextStyle(color,
      fontsize: fontSize,
      fontWeight: fontWeightManager.light,
      context: context);
}

TextStyle getBoldTextStyle(Color color,
    {double fontSize = Fontsize.s18, required BuildContext context}) {
  return _getTextStyle(
    color,
    fontsize: fontSize,
    fontWeight: fontWeightManager.bold,
    context: context,
  );
}
