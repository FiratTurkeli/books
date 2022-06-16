library home_view;

import 'package:auto_route/auto_route.dart';
import 'package:books_app/constants/color.dart';
import 'package:books_app/database/darktheme_provider.dart';
import 'package:books_app/router/router.dart';
import 'package:books_app/views/details/details.dart';
import 'package:books_app/views/readlist/readlist.dart';
import 'package:books_app/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/constants.dart';
import '../../models/user_model.dart';
import '../../view_models/home_view_model.dart';
import 'package:books_app/models/book_model.dart';
import 'package:books_app/widgets/item_card.dart';


part 'components/home_view_header.dart';
part 'components/home_view_body.dart';
part 'components/home_view_footer.dart';



class HomeView extends HomeViewModel {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: background(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: HomeViewHeader(),
          actions: [
            GestureDetector(
              onTap: (){
                context.router.navigate(ReadListRoute());
              },
              child: readListButton(),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:  size.width < 1200 ? 2 : 4,
          mainAxisSpacing: kDefaultPaddin,
          crossAxisSpacing: kDefaultPaddin/3,
          childAspectRatio: 0.6,
        ),
        itemCount: books.length,
        itemBuilder: (context, index){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HomeViewBody(book: books[index],),
              HomeViewFooter(book: books[index]),
            ],
          );
        },
          ),
      ),
    );
  }


  ActionChip buildActionChipCount(Color color){
    return ActionChip(
        backgroundColor: color,
        label: Text("${context.watch<User>().totalProduct}"),
        onPressed: (){
        }
    );
  }

  Container readListButton(){
    return Container(
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: myYellow
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Consumer<ThemeProvider>(
          builder: (context, provider,child) {
            return Row(
              children: [
                Center(child: Text("Read List", style: TextStyle(color: provider.currentTheme == "dark" ? black : white),)),
                Icon(Icons.menu_book_rounded, color: provider.currentTheme == "dark" ? black : white,),
                buildActionChipCount(provider.currentTheme == "dark" ? black : white)
              ],
            );
          }
        ),
      ),
    );
  }
}
