part of home_view;

class HomeViewBody extends StatelessWidget {
  Book book;
  HomeViewBody({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: ItemCard(
          book: book,
          press: (){
            context.router.navigate(DetailsRoute(book: book));}
      ),
    );
  }
}
