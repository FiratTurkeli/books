library details_view;

import 'dart:ui';
import 'package:books_app/views/readlist/readlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/color.dart';
import '../../constants/text_style.dart';
import '../../database/darktheme_provider.dart';
import '../../models/user_model.dart';
import '../../view_models/details_view_model.dart';
import 'package:books_app/models/book_model.dart';

part 'components/details_view_header.dart';
part 'components/details_view_body.dart';
part 'components/details_view_footer.dart';

class DetailsView extends DetailsViewModel with TickerProviderStateMixin {
  DetailsView({required super.book});


  late AnimationController controller;
  late AnimationController bodyScrollAnimationController;
  late ScrollController scrollController;
  late Animation<double> scale;
  late Animation<double> appBarSlide;
  double headerImageSize = 0;
  bool isFavorite = false;
  @override
  void initState() {

    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    bodyScrollAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    scrollController = ScrollController()
      ..addListener(() {
        if (scrollController.offset >= headerImageSize / 2) {
          if (!bodyScrollAnimationController.isCompleted) bodyScrollAnimationController.forward();
        } else {
          if (bodyScrollAnimationController.isCompleted) bodyScrollAnimationController.reverse();
        }
      });

    appBarSlide = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      parent: bodyScrollAnimationController,
    ));

    scale = Tween(begin: 1.0, end: 0.5).animate(CurvedAnimation(
      curve: Curves.linear,
      parent: controller,
    ));
    super.initState();
  }


  @override
  Widget build(BuildContext context){
    return ScaleTransition(
      scale: scale,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 22, sigmaY: 22),
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Stack(
            children: <Widget>[
              SingleChildScrollView(
                  controller: scrollController,
                  child:buildDetailsView()
              ),

              AnimatedBuilder(
                animation: appBarSlide,
                builder: (context, snapshot) {
                  return Transform.translate(
                    offset: Offset(0.0, -1000 * (1 - appBarSlide.value)),
                    child: Material(
                      elevation: 2,
                      color: Theme.of(context).primaryColor,
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDetailsView(){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //Publisher + Image + author + published
        DetailsViewHeader(book: book, bodyScrollAnimationController: bodyScrollAnimationController),
        //title + id+ genre + isbn
        DetailsViewBody(book: book, isFavorite: isFavorite),
        //description
        DetailsViewFooter(book: book),
      ],
    );
  }

}
