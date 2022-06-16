part of readlist_view;

class ReadlistViewFooter extends StatefulWidget {
  Book book;
   ReadlistViewFooter({Key? key, required this.book}) : super(key: key);

  @override
  State<ReadlistViewFooter> createState() => _ReadlistViewFooterState();
}

class _ReadlistViewFooterState extends State<ReadlistViewFooter> {
  @override
  Widget build(BuildContext context) {
    return buildIconButtonDelete(context, widget.book);
  }

  IconButton buildIconButtonDelete(BuildContext context, Book book) {
    return IconButton(
      icon: const Icon(Icons.delete_forever, color: white,),
      onPressed: () {

        setState((){
          context.read<User>().deleteProduct(book);
        });
      },
    );
  }
}
