import 'package:books_app/models/book_model.dart';
import 'package:books_app/services/book_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class User extends ChangeNotifier{

  Map<Book, int> readListBooks = {};

  List<Book> get Books => readListBooks.keys.toList();

  late BookServices service;

  User(BuildContext context){
    service = context.read<BookServices>();
  }



  int get totalProduct{
    return readListBooks.length;
  }


  void addFirstItemToBasket(Book product) {
    readListBooks[product] = 1;
    service.addProduct(product);
    notifyListeners();
  }


  void deleteProduct(Book book) {

    if (readListBooks[book] == null){
      return;
    } else {
      readListBooks.removeWhere((key, value) => key == book);
    }
    notifyListeners();
  }




}