part of readlist_view;

class ReadListViewBody extends StatelessWidget {
  Book book;
  ReadListViewBody({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: ItemCard(
          book: book,
          press: (){}
      ),
    );
  }
}
