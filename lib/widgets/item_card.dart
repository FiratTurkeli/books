import 'package:books_app/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/constants.dart';
import '../models/book_model.dart';
import '../models/user_model.dart';

class ItemCard extends StatelessWidget {
  Book book;
  VoidCallback press;
   ItemCard({
    Key? key,
    required this.book,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: myYellow
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: <Widget>[

            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
              child: Text(
                "${book.title}",
                style: TextStyle(color: kTextLightColor),
              ),
            ),
            Text(
              "${book.published}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(kDefaultPaddin),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: ThemeData().scaffoldBackgroundColor,
                ),
                child: Hero(
                  tag: "${book.id}",
                  child: Image.network("${book.image}",),
                ),
              ),
            ),
            Text(
              "${book.author}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "${book.genre}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }


}