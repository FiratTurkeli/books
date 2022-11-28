import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/book_model.dart';

class BookServices {
  var apiUrl= "https://fakerapi.it/api/v1/books?_quantity=100";


  Future<List<Book>> getAllBooks() async {
    final response = await Dio().get(apiUrl,);

    if (response.statusCode == 200) {
      print(response.statusCode);
      final responseBody = response.data["data"] as List;
      print(responseBody);
      return responseBody.map((e) => Book.fromJson(e)).toList();
    }

    throw Exception();
  }

  Future<bool> addProduct(Book book) async {
    final response = await Dio().post<Map<String, dynamic>>(apiUrl, data: jsonEncode(book), );

    if (response.statusCode == 200 ) {
      return true;
    }

    return false;
  }

}