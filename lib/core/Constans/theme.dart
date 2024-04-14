import 'package:e_commerce_os/core/Constans/Colors.dart';
import 'package:e_commerce_os/core/Constans/Font.dart';
import 'package:flutter/material.dart';

ThemeData getAppTheme() {
  return ThemeData(
    useMaterial3: true,

    //////////////////

    cardTheme: CardTheme(
      elevation: Fontsize.s8,
    ),
/////////////////
    appBarTheme: AppBarTheme(
      color: ColorManager.primary,
      // elevation: Fontsize.s22,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: getBoldTextStyle(
        Colors.black,
      ),
    ),
    ////////////////////

    ////////////////////
    textTheme: TextTheme(
        titleMedium: getMediumTextStyle(
          Colors.grey,
        ),
        displayLarge: getBoldTextStyle(
          Colors.grey,
        )),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(
        12,
      ),
      hintStyle: getRegulerTextStyle(
        Colors.grey,
      ),
      labelStyle: getRegulerTextStyle(
        Colors.grey,
      ),
      errorStyle: getMediumTextStyle(
        Colors.red,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(),
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(),
        borderRadius: BorderRadius.circular(
          0,
        ),
      ),
    ),
    brightness: Brightness.light,
    fontFamily: FontConstants.fontFamily,
    //////////////////
  );
}
