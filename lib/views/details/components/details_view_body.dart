part of details_view;

class DetailsViewBody extends StatefulWidget {
  Book book;
  bool isFavorite;
  DetailsViewBody({Key? key , required this.book, required this.isFavorite}) : super(key: key);

  @override
  State<DetailsViewBody> createState() => _DetailsViewBodyState();
}

class _DetailsViewBodyState extends State<DetailsViewBody> {
  @override
  Widget build(BuildContext context) {
    return  Consumer<ThemeProvider>(
      builder: (context, provider,child) {
        return Container(
          padding: const EdgeInsets.all(16),
          color: Theme.of(context).primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //title+id
              buildEventTitleAndId(Theme.of(context).textTheme.headline1?.color),
              //GENRE+ISBN
              buildGenreAndIsbn(),

            ],
          ),
        );
      }
    );
  }


  Widget buildEventTitleAndId(Color? color) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width*0.75,
          child: Text(
            widget.book.title.toString(),
            style: headerStyle.copyWith(fontSize: 25, color: color) ,
          ),
        ),
        Spacer(),
        Text(
          "ID: ${widget.book.id}",
          style: headerStyle.copyWith(fontSize: 25, color: color),
        ),

      ],
    );
  }

  Widget buildGenreAndIsbn() {
    return Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: primaryLight,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text("GENRE", style: authorstyle),
              Text(widget.book.genre.toString(), style: authorstyle),
            ],
          ),
        ),
        const Spacer(),
        buildIsbn()
      ],
    );
  }

  Widget buildIsbn(){
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: ShapeDecoration(shape: const StadiumBorder(), color: myYellow),
      child: Row(
        children: <Widget>[
          Column(
            children: [
              const Text("ISBN" , style: isbnstyle,),
              Text(widget.book.isbn.toString(), style: isbnstyle),
            ],
          ),
          FloatingActionButton(
            backgroundColor: white,
            onPressed: (){},
            child: const Icon(Icons.qr_code_scanner_sharp, color: black,
            ),
          )
        ],
      ),
    );
  }

}
