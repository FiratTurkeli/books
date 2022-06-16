part of home_view;

class HomeViewFooter extends StatefulWidget {
  Book book;
  HomeViewFooter({Key? key, required this.book}) : super(key: key);

  @override
  State<HomeViewFooter> createState() => _HomeViewFooterState();
}

class _HomeViewFooterState extends State<HomeViewFooter> {
  @override
  Widget build(BuildContext context) {
    return buildIconButtonAdd(context, widget.book);
  }


  IconButton buildIconButtonAdd(BuildContext context, Book book) {
    return IconButton(
      icon: const Icon(Icons.add_circle, color: white,),
      onPressed: () {
        context.read<User>().addFirstItemToBasket(book);
      },
    );
  }

}
