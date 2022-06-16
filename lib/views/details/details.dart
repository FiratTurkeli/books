import 'package:flutter/material.dart';
import '../../models/book_model.dart';
import 'details_view.dart';

class Details extends StatefulWidget {
   Book book;
   Details({required this.book});

  @override
  DetailsView createState() => new DetailsView (book: book);

}
