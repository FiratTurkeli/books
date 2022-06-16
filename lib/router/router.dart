import 'package:auto_route/auto_route.dart';
import 'package:books_app/models/book_model.dart';
import 'package:books_app/responsive.dart';
import 'package:books_app/views/details/details.dart';
import 'package:books_app/views/readlist/readlist.dart';
import 'package:flutter/material.dart';
import 'package:books_app/views/home/home.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: "View, Route",
    routes: <AutoRoute>[
        AutoRoute(
            page: Responsive,
            path: "/responsive",
            initial: true
        ),
    AutoRoute(
      page: Home,
        path: "/home",
    ),
        AutoRoute(
            page: ReadList,
            path: "/readList"
        ),
        AutoRoute(
            page: Details,
            path: "/details"
        ),

]
)
class AppRouter extends _$AppRouter{

}