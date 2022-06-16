import 'package:books_app/services/book_services.dart';
import 'package:books_app/views/details/details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/book_model.dart';


abstract class DetailsViewModel extends State<Details>{
  late Book book;
  DetailsViewModel({required this.book});
}