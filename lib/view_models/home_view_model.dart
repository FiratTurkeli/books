import 'package:books_app/models/book_model.dart';
import 'package:books_app/services/book_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../views/home/home.dart';

abstract class HomeViewModel extends State<Home> {

  List books = <Book>[];


  @override
  void initState() {
    super.initState();
    getAllProducts();
  }

  void  getAllProducts() async {
    books = await context.read<BookServices>().getAllBooks();
    setState(() {

    });
  }


}