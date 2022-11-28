import 'package:books_app/constants/color.dart';
import 'package:flutter/material.dart';



// Light and dark theme data

ThemeData lightTheme = ThemeData(
    highlightColor: black,
    primaryColor: white,
    textTheme: const TextTheme(bodyText2: TextStyle(color: white) , bodyText1: TextStyle(color: black), headline1: TextStyle(color: black) ),
    iconTheme: const IconThemeData(
    color: black
  )
);

ThemeData darkTheme = ThemeData(
    highlightColor: myYellow,
    primaryColor: myGrey,
    textTheme: const TextTheme(bodyText2: TextStyle(color: black), bodyText1: TextStyle(color: black), headline1: TextStyle(color: white)),
    iconTheme: const IconThemeData(
        color: white
    )
);
