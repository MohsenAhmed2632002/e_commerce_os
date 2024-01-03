import 'package:e_commerce_os/core/Constans/Font.dart';
import 'package:e_commerce_os/core/color_schemes.g.dart';
import 'package:flutter/material.dart';

ThemeData getAppTheme() {
  return ThemeData(
    colorScheme: lightColorScheme,
    useMaterial3: true,


    ////////////////
    cardTheme: CardTheme(
      elevation: Fontsize.s8,
    ),
/////////////////
    appBarTheme: AppBarTheme(
      titleTextStyle: getBoldTextStyle(lightColorScheme.onPrimary),
      elevation: Fontsize.s12,
      centerTitle: true,
      backgroundColor: lightColorScheme.primary,
    ),
    ////////////////////
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegulerTextStyle(
          Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
      ),
    ),
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
    // brightness: Brightness.light,
    fontFamily: FontConstants.fontFamily,
    //////////////////
  );
}
