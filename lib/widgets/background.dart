import 'package:flutter/material.dart';

BoxDecoration background(BuildContext context){
  return  BoxDecoration(
      image:  DecorationImage(
        image: AssetImage(
            Theme.of(context).brightness == Brightness.light
            ?"images/book.jpg"
        : "images/book_dark.jpg",
        ),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(Colors.grey.withOpacity(0.7), BlendMode.darken),
      )
  );
}