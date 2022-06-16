part of details_view;

class DetailsViewHeader extends StatefulWidget {
  Book book;
  AnimationController bodyScrollAnimationController;
  DetailsViewHeader({Key? key, required this.book, required this.bodyScrollAnimationController}) : super(key: key);

  @override
  State<DetailsViewHeader> createState() => _HomeViewHeaderState();
}

class _HomeViewHeaderState extends State<DetailsViewHeader> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        imageAuthorPublisherPublished(), //Publisher + Image + author + published
        buildHeaderButton(context),
      ],
    );
  }

  Widget imageAuthorPublisherPublished(){
    return  Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
        color: Colors.white,

      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          buildImage(),
          authorPublisherPublished()
        ],
      ),
    );
  }

  Widget authorPublisherPublished(){
    return Column(
      children: [
        buildAuthor(),
        buildAuthorPublished(),
        buildAuthorPublisher(),
      ],
    );
  }

  Widget buildImage(){
    return   Center(
      child: Hero(
        tag: "${widget.book.id}",
        child: Image.network("${widget.book.image}", fit: BoxFit.fitWidth,),
      ),
    );
  }

  Widget buildAuthor(){
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: greyOp,
          borderRadius: BorderRadius.circular(16)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text("Author", style: authorstyle, textAlign: TextAlign.center,),
            Text(widget.book.author.toString(),  style: titleStyle, textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }


  Widget buildAuthorPublisher(){
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: greyOp,
          borderRadius: BorderRadius.circular(16)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text("Publisher", style: authorstyle, textAlign: TextAlign.center,),
            Text(widget.book.publisher.toString(),  style: titleStyle, textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }



  Widget buildAuthorPublished(){
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: greyOp,
          borderRadius: BorderRadius.circular(16)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text("Published", style: authorstyle, textAlign: TextAlign.center,),
            Text(widget.book.published.toString(),  style: titleStyle, textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }

  Widget buildHeaderButton(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 0,
              margin: const EdgeInsets.all(0),
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  if (widget.bodyScrollAnimationController.isCompleted) widget.bodyScrollAnimationController.reverse();
                  Navigator.of(context).pop();
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color:  Colors.black,
                  ),
                ),
              ),
            ),

            readListButton(),
          ],
        ),
      ),
    );
  }

  Widget readListButton(){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ReadList()));
      },
      child:Container(
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

}
