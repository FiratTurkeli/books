import 'package:flutter/material.dart';

import '../constants/color.dart';

BoxDecoration background(BuildContext context){
  return  BoxDecoration(
      image:  DecorationImage(
        image: AssetImage(
            Theme.of(context).textTheme.headline1?.color == black
            ?"images/book.jpg"
        : "images/book_dark.jpg",
        ),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(Colors.grey.withOpacity(0.7), BlendMode.darken),
      )
  );
}