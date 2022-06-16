library readlist_view;

import 'package:books_app/view_models/readlist_view_model.dart';
import 'package:books_app/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/color.dart';
import '../../constants/constants.dart';
import '../../models/user_model.dart';
import 'package:books_app/models/book_model.dart';
import 'package:books_app/widgets/item_card.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

part 'components/readlist_view_body.dart';
part 'components/readlist_view_footer.dart';

class ReadListView extends ReadListViewModel {
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: background(context),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: ReorderableGridView.count(
          shrinkWrap: true,
          crossAxisCount: size.width < 1200 ? 2 : 4,
          mainAxisSpacing: kDefaultPaddin,
          crossAxisSpacing: kDefaultPaddin/3,
          childAspectRatio: 0.6,
          children: this.context.watch<User>().Books.map((book) =>  Column(
            key: Key(book.id.toString()),
                children: [
                  ReadListViewBody(book: book),
                  ReadlistViewFooter(book: book)

                ],
              )).toList(),
          onReorder: (int oldIndex, int newIndex) {
            setState(() {

                final book = context.read<User>().Books.removeAt(oldIndex);
                context.read<User>().Books.insert(newIndex, book);
              });


          },

        ),
      ),
    );
  }




}